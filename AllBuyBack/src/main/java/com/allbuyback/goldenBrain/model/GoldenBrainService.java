package com.allbuyback.goldenBrain.model;

public class GoldenBrainService {

     private GoldenBrainDAOInterface dao;	
     
     public GoldenBrainService(){ //建構子
    	 dao=new GoldenBrainDAOjdbc();
     }
          
     public int checkGBTime(String m_account){
    	 MemberBean memberBean=dao.selectGBTime(m_account);
 		 int gbTime = memberBean.getM_times_gb();
    	 return gbTime;
     }
     
     
     public String getJSON5Q(){
    	 String json5Q=dao.select5Q();
    	 return json5Q;
     }
     
     //select尚未更新前的點數
     public int getOldBonus(String m_account){
    	 MemberBean memberBean=dao.selectBonus(m_account);
    	 int myOldBonus = memberBean.getM_point();
    	 return myOldBonus;
     }
     
     //更新點數
     public int getNewBonus(int m_point,String m_account){
    	 MemberBean memberBean=dao.updateBonus(m_point,m_account);
    	 int theNewestBonus=memberBean.getM_point();
    	 return theNewestBonus;
     }
     

     
}
