package com.allbuyback.AllBuyBack.model.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.allbuyback.AllBuyBack.model.CountryBean;
import com.allbuyback.AllBuyBack.model.ItemBean;
import com.allbuyback.AllBuyBack.model.ItemService;
import com.allbuyback.AllBuyBack.model.dao.CountryDAOHibernate;
import com.allbuyback.AllBuyBack.model.misc.PrimitiveNumberEditor;
import com.allbuyback.Wishing_Pool.model.Wishing_PoolDAO;

@Controller
@MultipartConfig()
@RequestMapping(path={"/item.SPRINGcontroller"})  
public class ItemController {
	
	@Autowired
	private ItemService itemService;
	@Autowired
	private CountryDAOHibernate countryDAOHibernate;
	
	Wishing_PoolDAO wpDAO = new Wishing_PoolDAO();
	
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
	
	
	@RequestMapping(method={RequestMethod.GET,RequestMethod.POST})
	public String doGet(ItemBean bean,BindingResult bindingResult,String prodaction, Model model,HttpServletRequest request, @RequestParam(value="picture1",required=false) MultipartFile picture1, @RequestParam(value="picture2",required=false) MultipartFile picture2, @RequestParam(value="picture3",required=false) MultipartFile picture3, @RequestParam(value="picture4",required=false) MultipartFile picture4, @RequestParam(value="picture5",required=false) MultipartFile picture5){		                                                                 

		try {
			String i_name = new String(bean.getI_name().getBytes("ISO8859-1"),"UTF-8");
			String i_describe = new String(bean.getI_describe().getBytes("ISO8859-1"),"UTF-8");
			bean.setI_name(i_name);
			bean.setI_describe(i_describe);
			System.out.println("---------"+i_name+"---------");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
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
    			errors.put("i_price", "商品價格必須為整數");
    		}  
    		if(bindingResult.getFieldError("i_arrivedDate")!=null){
    			errors.put("i_arrivedDate", "到貨日期格式不符");
    		}
    		if(bindingResult.getFieldError("i_onSellDate")!=null){
    			errors.put("i_onSellDate", "i_onSellDate格式不符");
    		}  
    		if(bindingResult.getFieldError("i_quantity")!=null){
    			errors.put("i_quantity", "數量必須為整數");
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
    				errors.put("i_name", "請輸入商品名稱");
    			}
    			if(bean.getI_name().length()>25){
    				errors.put("i_name", "商品名稱過長，請勿超過25字");
    			}
    			if(bean.getI_describe().isEmpty()){
    				errors.put("i_describe", "請輸入商品描述");
    			}
    			if(bean.getCountry_id()==0){
    				errors.put("country_id", "請輸入國家");
    			}
    			if(bean.getI_arrivedDate()==null){
    				errors.put("i_arrivedDate", "請輸入到貨日期");
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
				if(picture1!=null){
					byte[] pic1 = this.getByte(picture1);
					bean.setI_picture1(pic1);
				}			
				if(picture2!=null){
					byte[] pic2 = this.getByte(picture2);
					bean.setI_picture2(pic2);
				}			
				if(picture3!=null){
					byte[] pic3 = this.getByte(picture3);
					bean.setI_picture3(pic3);
				}			
				if(picture4!=null){
					byte[] pic4 = this.getByte(picture4);
					bean.setI_picture4(pic4);
				}			
				if(picture5!=null){
					byte[] pic5 = this.getByte(picture5);
					bean.setI_picture5(pic5);
				}
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
				if(bean.getI_status()==3){
					break;
				}
				
				if(picture1!=null){
					byte[] pic1 = this.getByte(picture1);
					bean.setI_picture1(pic1);
				}			
				if(picture2!=null){
					byte[] pic2 = this.getByte(picture2);
					bean.setI_picture2(pic2);
				}			
				if(picture3!=null){
					byte[] pic3 = this.getByte(picture3);
					bean.setI_picture3(pic3);
				}			
				if(picture4!=null){
					byte[] pic4 = this.getByte(picture4);
					bean.setI_picture4(pic4);
				}			
				if(picture5!=null){
					byte[] pic5 = this.getByte(picture5);
					bean.setI_picture5(pic5);
				}			
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				bean.setI_onSellDate((new Date()));
				ItemBean result3 = itemService.update(bean);
				if(result3==null) {
					errors.put("action", "Update fail");
				} else {
					
					String i_arrivedDate = sdf.format(result3.getI_arrivedDate());
					String i_onSellDate = sdf.format(result3.getI_onSellDate());
					model.addAttribute("i_arrivedDate", i_arrivedDate);
					model.addAttribute("i_onSellDate", i_onSellDate);
					model.addAttribute("itembean", result3);
					model.addAttribute("update", 1);
				}
				break;
		}
		return this.returnX(prodaction);
	}
	
	public byte[] getByte(MultipartFile picture){
		try {
			InputStream is = picture.getInputStream();
			ByteArrayOutputStream out = new ByteArrayOutputStream();
			byte[] buffer = new byte[4096000];
			int len = -1;
			while((len = is.read(buffer))!=-1){
				out.write(buffer, 0, len);
			}
			is.read();
			out.close();			
			return out.toByteArray();			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		return null;		
	}
}
