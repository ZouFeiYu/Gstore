package org.gdpi.store.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.gdpi.store.bean.Address;
import org.gdpi.store.bean.AskResult;
import org.gdpi.store.bean.User;
import org.gdpi.store.service.AddressService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/action")
public class AddressController {
	@Resource
	AddressService addressService;

	@RequestMapping("/address/{id}")
	@ResponseBody
	public AskResult<List<Address>> checkAddress(@PathVariable int id) {
		AskResult<List<Address>> askResult = new AskResult<>();
		List<Address> addresses = null; 
		try {
			addresses = addressService.selectAddress(id);
			if (addresses == null) {
				askResult.setCode(0);
				askResult.setMsg("数据库没有该用户的地址记录");
			} else {
				askResult.setCode(1);
				askResult.setMsg("找到该用户的地址记录");
			}

		} catch (Exception e) {
			askResult.setCode(-1);
			askResult.setMsg("查询失败");
		}
		askResult.setData(addresses);
		return askResult;
	} 
	@RequestMapping("/checkAddress/{id}")
	@ResponseBody
	public AskResult<Address> checkAddressById(@PathVariable int id) {
		AskResult<Address> askResult = new AskResult<>();
		Address addresses = null; 
		try {
			addresses = addressService.selectAddressById(id);
			if (addresses == null) {
				askResult.setCode(0);
				askResult.setMsg("数据库没有该用户的地址记录");
			} else {
				askResult.setCode(1);
				askResult.setMsg("找到该用户的地址记录");
			}

		} catch (Exception e) {
			askResult.setCode(-1);
			askResult.setMsg("查询失败");
		}
		askResult.setData(addresses);
		return askResult;
	}

	@RequestMapping("/updateOrAddAddress/{userid}")
	@ResponseBody
	public AskResult<List<Address>> updateOrAddAddress(@RequestParam("addressId") String id,
			@RequestParam("receiverName") String consignee, @RequestParam("receiverCity") String citieCode,
			@RequestParam("receiverState") String provinceCode, @RequestParam("receiverDistrict") String areaCode,
			@RequestParam("receiverAddress") String detailed, @RequestParam("receiverMobile") String phone,
			@RequestParam("receiverPhone") String fixedPhone, @RequestParam("receiverZip") String postalCode,
			@RequestParam("addressName") String addressName, @PathVariable("userid") int userId) {
		Address address=new Address();
		address.setAddressName(addressName);
		address.setAreaCode(areaCode);
		address.setCitieCode(citieCode);
		address.setConsignee(consignee);
		address.setDetailed(detailed);
		address.setFixedPhone(fixedPhone);
		//address.setId(id);
		address.setPhone(phone);
		address.setPostalCode(postalCode);
		address.setProvinceCode(provinceCode);
		address.setState(0);
		address.setUserId(userId);
		Logger.getLogger(getClass()).debug(address); 
		AskResult<List<Address>> askResult = new AskResult<>();
		if(id==null||"".equals(id)) {
			//TODO 这是添加地址
			if(addressService.insertAddress(address)) {
				askResult.setCode(1);
				askResult.setMsg("添加地址成功");
			}else { 
				askResult.setCode(0);
				askResult.setMsg("添加地址失败");
			}
		}else { 
			//TODO 这是修改地址
			if(addressService.updateAddress(address)) {
				askResult.setCode(1);
				askResult.setMsg("修改地址成功");
			}else {
				askResult.setCode(0);
				askResult.setMsg("修改地址失败");
			}
		}
		return askResult; 
	}
	@RequestMapping("updateAddressState/{id}")
	@ResponseBody
	public AskResult<Void>  updateAddressState(@PathVariable int id,HttpSession session){
		AskResult<Void> askResult=new AskResult<>();
		User user=(User)session.getAttribute("onLineUser");
		if(addressService.setAddrDefault(id, user.getId())) {
			askResult.setCode(1); 
			askResult.setMsg("修改为默认成功");
		}else {
			askResult.setCode(1);
			askResult.setMsg("修改为默认失败");
		}
		return askResult;
	}
}
