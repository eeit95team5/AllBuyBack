package com.allbuyback.AllBuyBack.model.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.allbuyback.AllBuyBack.model.CountryBean;
import com.allbuyback.AllBuyBack.model.ItemBean;
import com.allbuyback.AllBuyBack.model.ItemService;
import com.allbuyback.AllBuyBack.model.dao.CountryDAOHibernate;
import com.allbuyback.AllBuyBack.model.misc.PrimitiveNumberEditor;

@Controller
@RequestMapping(path={"/item.SPRINGcontroller"})  
public class ItemController {
	
	@Autowired
	private ItemService itemService;
	@Autowired
	private CountryDAOHibernate countryDAOHibernate;
	
	@InitBinder
	protected void yyy(WebDataBinder binder){
		binder.registerCustomEditor(java.util.Date.class, 
				new CustomDateEditor((DateFormat)new SimpleDateFormat("yyyy-MM-dd"),true));
		binder.registerCustomEditor(int.class, new PrimitiveNumberEditor(Integer.class, true));
		binder.registerCustomEditor(double.class, new PrimitiveNumberEditor(Double.class, true));
	}
	
	private String returnX(String prodaction){
		if("Insert".equals(prodaction)){
			return "insertitem";
		}
		if("Update".equals(prodaction)){
			return "updateitem";
		}
		
		return "product";
	}
	// return this.returnX(prodaction);
	
	@RequestMapping(method={RequestMethod.GET, RequestMethod.POST})
	public String doGet(ItemBean bean,BindingResult bindingResult,String prodaction, Model model){
		
		System.out.println("=============");
		System.out.println(bean.getI_id());
		System.out.println(bean.getS_id());
		System.out.println(bean.getI_name());
		System.out.println(bean.getI_arrivedDate());
		System.out.println("=============");
		
		if(prodaction==null){						
			return "product";
		}
		
		List<CountryBean> country = countryDAOHibernate.select();
		model.addAttribute("country", country);					
		
		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);
		
		if(bindingResult != null){
			if(bindingResult.getFieldError("i_id")!=null){
				errors.put("i_id", "id必須為整數");
			}
			if(bindingResult.getFieldError("s_id")!=null){
				errors.put("s_id", "id必須為整數");
			}
    		if(bindingResult.getFieldError("i_price")!=null){
    			errors.put("i_price", "price必須為整數");
    		}  
    		if(bindingResult.getFieldError("i_arrivedDate")!=null){
    			errors.put("i_arrivedDate", "i_arrivedDate格式不符");
    		}
    		if(bindingResult.getFieldError("i_onSellDate")!=null){
    			errors.put("i_onSellDate", "i_onSellDate格式不符");
    		}  
    		if(bindingResult.getFieldError("i_quantity")!=null){
    			errors.put("i_quantity", "i_quantity必須為整數");
    		}
    		if(bindingResult.getFieldError("i_status")!=null){
    			errors.put("i_status", "i_status必須為整數");
    		}
    		if(bindingResult.getFieldError("i_soldQuantity")!=null){
    			errors.put("i_soldQuantity", "i_soldQuantity必須為整數");
    		}
    		if(bindingResult.getFieldError("i_click")!=null){
    			errors.put("i_click", "i_click必須為整數");
    		}
    		if(bindingResult.getFieldError("i_popular")!=null){
    			errors.put("i_popular", "i_popular必須為整數");
    		}
    		if(bindingResult.getFieldError("s_class1")!=null){
    			errors.put("s_class1", "s_class1必須為整數");
    		}
    		if(bindingResult.getFieldError("s_class2")!=null){
    			errors.put("s_class2", "s_class2必須為整數");
    		}
    		
    		
    		if("Insert".equals(prodaction)){
    			if(bean.getI_id()!=0){
    				errors.put("i_id", "insert請勿輸入i_id");
    			}
    		}
    		
    		if(("Update".equals(prodaction)||"Delete".equals(prodaction))&&bean.getI_id()==0){    			
    			errors.put("i_id", "請輸入i_id");
    			
    		}    		    	    		
    		
    		if("Update".equals(prodaction) || "Insert".equals(prodaction)){    			  			
    			if(bean.getI_name().isEmpty()){
    				errors.put("i_name", "請輸入i_name");
    			}
    			if(bean.getI_describe().isEmpty()){
    				errors.put("i_describe", "請輸入i_describe");
    			}
    			if(bean.getCountry_id()==0){
    				errors.put("country_id", "請輸入country_id");
    			}
    			if(bean.getI_arrivedDate()==null){
    				errors.put("i_arrivedDate", "請輸入i_arrivedDate");
    			}
    			if(bean.getI_onSellDate()==null){
//    				errors.put("i_onSellDate", "請輸入i_onSellDate");
    				bean.setI_onSellDate(new Date());
    			}
    			if(bean.getI_class1()==0){
    				errors.put("i_class1", "請輸入i_class1");
    			}
    			if(bean.getI_class2()==0){
    				errors.put("i_class2", "請輸入i_class2");
    			}
    			if(bean.getI_class3()==0){
    				errors.put("i_class3", "請輸入i_class3");
    			}
    		}    		    		
    	}
		
		
		
		
		if(errors!=null && !errors.isEmpty()) {	
			model.addAttribute("result", bean);
			model.addAttribute("insert", bean);
			model.addAttribute("itembean", bean);
			System.out.println("=============");
			System.out.println(bean.getI_id());
			System.out.println("=============");
			return this.returnX(prodaction);
		}
		
		
		switch(prodaction){
			case "Select":
				List<ItemBean> result = itemService.select(bean);
				model.addAttribute("result", result);
				model.addAttribute("select", result.size());				
				break;
			case "Insert":
				bean.setI_soldQuantity(0);
				bean.setI_status(1);
				bean.setI_popular(0);
				bean.setI_click(0);
				ItemBean result1 = itemService.insert(bean);
				if(result1==null) {
					errors.put("action", "Insert fail");
				} else {
					model.addAttribute("result", result1);
					model.addAttribute("insert", bean);
					model.addAttribute("insertsuccess", 1);
				}
				break;
			case "Delete":
				ItemBean bean2;
			try {
				bean2 = itemService.select(bean).get(0);
			
				boolean result2 = itemService.delete(bean);
				if(!result2) {
					model.addAttribute("delete", 0);
				} else {
					model.addAttribute("delete", 1);
					model.addAttribute("result", bean2);					
				}
				break;
			} catch (Exception e) {
				errors.put("i_id", "i_id不正確");
				break;
			}
			case "Update":
				ItemBean result3 = itemService.update(bean);
				if(result3==null) {
					errors.put("action", "Update fail");
				} else {
					model.addAttribute("itembean", result3);
					model.addAttribute("update", 1);
				}
				break;
		}
		return this.returnX(prodaction);
	}
}
