package com.cfr.web.member.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cfr.web.favorite.service.FavoriteService;
import com.cfr.web.member.service.MemberService;
import com.google.gson.Gson;


@Controller
public class MemberController {
	
   @Autowired
   MemberService memberService;
   @Autowired
   FavoriteService favoriteService;
   @Autowired
   private JavaMailSender mailSender;
   
   private String from = "cfr171120@gmail.com";         //메일을 보낼 계정
   private String subject = "LIVELINK 회원가입 인증 코드";   //메일 제목


   @RequestMapping(value = "/member/registForm")
   public String registForm() {
      return "/member/registForm";
   }
// 회원가입 이메일 인증번호 발송관련
   @RequestMapping(value = "/member/emailcheck", method = RequestMethod.POST, produces = "application/json")
   @ResponseBody
   public boolean sendMailAuth(HttpSession session, @RequestParam Map<String, Object> map) {
      //System.out.println(map);
       int ran = new Random().nextInt(9000) + 1000; // 1000 ~ 9999 인증번호를 랜덤으로 생성
       String joinCode = String.valueOf(ran);
       session.setAttribute("joinCode", joinCode);   //세션에 인증번호 저장
       StringBuilder sb = new StringBuilder();
       sb.append("귀하의 인증 코드는 ").append(joinCode).append(" 입니다.");   //메일내용
       StringBuffer emailtotal = new StringBuffer();
       emailtotal.append(map.get("m_email").toString());   //받을 이메일 계정 설정
       
       MimeMessage message = mailSender.createMimeMessage();   //비어있는 메일 메세지 생성
       try {
        MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");   //메일 메세지 설정   
        messageHelper.setTo(emailtotal.toString());//메일을 받을 계정
        messageHelper.setText(sb.toString());      //메일 내용
        messageHelper.setFrom(from);            //메일을 보낼 계정
        messageHelper.setSubject(subject);         //메일 제목
        mailSender.send(message);               //JavaMailSender를 통한 메일발송
       } catch(Exception e) {
          e.printStackTrace();
          session.removeAttribute("joinCode");
          return false;            //메일발송실패시에 false
       }
       System.out.println(session.getAttribute("joinCode"));
       return true;
   }
   @RequestMapping(value = "/member/confirmAuthCode", method = RequestMethod.POST, produces = "application/json")
   @ResponseBody
   public String confirmAuthCode(HttpSession session, @RequestParam Map<String, Object> map) {
	   boolean flag = false;
	   String code = session.getAttribute("joinCode").toString();
	   String inputcode = map.get("code").toString();
	   if(code.equals(inputcode)) {
		   flag = true;
	   }
	   Map<String, Object> model = new HashMap<String, Object>();
       model.put("flag", flag);

	   return new Gson().toJson(model);
   }
   
   @RequestMapping(value = "/member/regist", method = RequestMethod.POST)
   public String regist(@RequestParam Map map,Model model) {
	  
      model.addAttribute("flag", memberService.regist(map));
      model.addAttribute("msg", "회원가입");
      model.addAttribute("forward_url", "/");

      return "/alert/alert";
   }
   @RequestMapping(value = "/member/loginForm")
   public String loginFormManager() {
      return "/member/loginForm";
   }
   @RequestMapping(value = "/member/login", method = RequestMethod.POST)
   @ResponseBody
   public String login(HttpSession session, @RequestParam Map map, Model model) {
      System.out.println("로그인메소드실행");
      System.out.println(map);
      if(memberService.login(map) == 1 ) {
         if(map.get("m_id") != null) {
            session.setAttribute("m_id", memberService.select(map).get("m_id"));
            session.setAttribute("m_name", memberService.select(map).get("m_name"));
         } else if(map.get("f_id") != null) {
            session.setAttribute("f_id", memberService.select(map).get("f_id"));
            session.setAttribute("f_name", memberService.select(map).get("f_name"));
            System.out.println(map);
            return "1";   //ajax이기때문에 뷰창으로감
         }
         return "1";
      } else {
         return "0";
      }   
   }
   // 로그인 확인창 처리
	@RequestMapping(value = "/login/alert")
	   public String loginSuccess(Model model,@RequestParam Map map) {
		model.addAllAttributes(map);
	      return "/alert/alert";
	   }
	
   // 로그아웃처리
   @RequestMapping("/member/logout")
   public String logout(HttpSession session,Model model) {
      if(session.getAttribute("m_id") != null) {
    	  session.invalidate(); 
         model.addAttribute("flag",1);
      } else if(session.getAttribute("f_id") != null) {
         session.invalidate(); 
         model.addAttribute("flag",1);
      }
      model.addAttribute("forward_url", "/");
      model.addAttribute("msg", "로그아웃");
      return "/alert/alert";
   }

   // 회원정보 업뎃창 띄우기
   @RequestMapping(value = "/member/updateForm")
   public String updateForm(Model model, @RequestParam Map map, HttpSession session) {
      map.put("m_id", session.getAttribute("m_id"));
      model.addAllAttributes(memberService.select(map));
      return "/member/updateForm";
   }

   // 회원정보업데이트
   @RequestMapping(value = "/member/update")
   public String update(@RequestParam Map map,Model model) {

      model.addAttribute("flag", memberService.update(map));
      model.addAttribute("msg", "회원 정보 수정");
      model.addAttribute("forward_url", "/");
      return "/alert/alert";
   }

   // 회원삭제
   @RequestMapping(value = "/member/delete", method = RequestMethod.POST)
   public String delete(@RequestParam Map map, HttpSession session,Model model) {
	  session.invalidate(); 
	  favoriteService.deleteAll(map);
	 
      model.addAttribute("flag", memberService.delete(map));
      model.addAttribute("msg", "회원 정보 수정");
      model.addAttribute("forward_url", "/member/loginForm");

      return "/alert/alert";
   }

   @RequestMapping(value = "/member/findInfo")
   public String findInfo() {
      return "/member/findInfo";
   }
   
   //id 중복검사
   @RequestMapping(value = "/member/checkId", method = { RequestMethod.GET, RequestMethod.POST})
   	public @ResponseBody int checkId(@RequestParam Map map) {
	   //Map m_id = memberService.select(map);
	   if(memberService.select(map)!=null) {
		   return 1;
	   } 
	   else if(memberService.select(map)==null) {
		   return 0;
	   }
	   return 0;
   }
   
   //id검색하기
  @RequestMapping(value = "/member/findcf", method = RequestMethod.POST)
      public String findcf(@RequestParam Map map, Model model) {
   
         Map result = memberService.findcf(map);
         System.out.println("★★★★★" + result + "★");
        try {
           if (result.get("m_no")!=null) {
              System.out.println("1111111111");
              model.addAttribute("m_info",result);
              System.out.println("★" + result + "★");
           } else if (result.get("m_no")==null){
              model.addAttribute("msg","fail");
              System.out.println("결과값이 들어가는건가 ?");
           }
        }catch(NullPointerException ne) {
        }
     return "/member/findcf";
  }
      
    //pw검색하기
      @RequestMapping(value = "/member/findpw", method = RequestMethod.POST)
  public String findpw(@RequestParam Map map, Model model) {
     
     Map result = memberService.findpw(map);
     System.out.println("★" + result + "★");
        try {  
           if (result.get("m_no")!=null) {
              System.out.println("1111111111");
              model.addAttribute("m_info",result);
              System.out.println("★" + result + "★");
           } else {
              model.addAttribute("msg", "fail");
           }  
        }catch(NullPointerException ne) {
        
     }
     return "/member/findpw";
  }

}