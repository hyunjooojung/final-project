package fp.busan.mvc.room.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import fp.busan.mvc.room.mapper.RoomMapper;
import fp.busan.mvc.room.model.vo.AmountVO;
import fp.busan.mvc.room.model.vo.KakaoPayApprovalVO;
import fp.busan.mvc.room.model.vo.Room;
import fp.busan.mvc.room.model.vo.kakaoPayReadyVO;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;


@Service
public class KakaoPay {
	
	
	@Autowired
	private RoomMapper mapper;
	
	private static final String HOST = "https://kapi.kakao.com";

	private kakaoPayReadyVO kakaoPayReadyVO;
	private KakaoPayApprovalVO kakaoPayApprovalVO;
	private KakaoPayApprovalVO kakaoPayApprovalVO2 = new KakaoPayApprovalVO();
	private AmountVO amountVO = new AmountVO();

	public String kakaoPayReady(Map<String, String> param) {
		System.out.println("2" + param.toString());
		RestTemplate restTemplate = new RestTemplate();
		
		

		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "b295e6f7e9159b1f32d0c15d8592d53c");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		/*
		 * params.add("cid", "TC0ONETIME"); params.add("partner_order_id", "1001");
		 * params.add("partner_user_id", "gorany"); params.add("item_name", "갤럭시S9");
		 * params.add("quantity", "1"); params.add("total_amount", "2100");
		 * params.add("tax_free_amount", "100"); params.add("approval_url",
		 * "http://localhost:8081/fp/room/kakaoPaySuccess"); params.add("cancel_url",
		 * "http://localhost:8081/kakaoPayCancel"); params.add("fail_url",
		 * "http://localhost:8081/kakaoPaySuccessFail");
		 */
		params.add("cid", "TC0ONETIME");
		params.add("partner_order_id", param.get("partner_order_id"));
		params.add("partner_user_id", param.get("partner_user_id"));
		params.add("item_name", param.get("item_name"));
		params.add("quantity", param.get("quantity"));
		params.add("total_amount", param.get("total_amount"));
		params.add("tax_free_amount", "100");
		params.add("code", param.get("partner_order_id"));
		params.add("userCode", param.get("userCode"));
		params.add("checkIn", param.get("checkIn"));
		params.add("checkOut", param.get("checkOut"));
		params.add("people", param.get("people"));
		/*
		 * params.add("approval_url", "http://localhost:8081/fp/room/kakaoPaySuccess");
		 */
		params.add("approval_url", "http://localhost/fp/room/insertBooking?code=" + param.get("partner_order_id") + 
																			"&checkIn=" + param.get("checkIn") +
																			"&checkOut=" + param.get("checkOut") +
																			"&guests=" + param.get("people"));
		params.add("cancel_url", "http://localhost/kakaoPayCancel");
		params.add("fail_url", "http://localhost/kakaoPaySuccessFail");
		
		
		

		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		try {
			kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body,
					kakaoPayReadyVO.class);
			
			
			
			 kakaoPayApprovalVO2.setCid("TC0ONETIME");
			 kakaoPayApprovalVO2.setPartner_order_id(param.get("partner_order_id"));
			 kakaoPayApprovalVO2.setPartner_user_id(param.get("partner_user_id"));
			 amountVO.setTotal(Integer.parseInt(param.get("total_amount")));
			 amountVO.setTax_free(100); 
			 kakaoPayApprovalVO2.setAmount(amountVO);
			 kakaoPayApprovalVO2.setQuantity(Integer.parseInt(param.get("quantity")));
			 kakaoPayApprovalVO2.setUser_code(param.get("userCode"));
			 kakaoPayApprovalVO2.setCode(param.get("partner_order_id"));
			 kakaoPayApprovalVO2.setCheckIn(param.get("checkIn"));
			 kakaoPayApprovalVO2.setCheckOut(param.get("checkOut"));
			 kakaoPayApprovalVO2.setPeople(param.get("people"));
			 
			
			 
			
			
			
			

			return kakaoPayReadyVO.getNext_redirect_pc_url();

		} catch (RestClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "pay";

	}

	public KakaoPayApprovalVO kakaoPayInfo(String pg_token) {

		System.out.println("pg_token : " + pg_token);
		System.out.println("kakaoPayReadyVO : " + kakaoPayReadyVO.toString());
		System.out.println("kakaoPayApprovalVO2 : " + kakaoPayApprovalVO2.toString());
		

		RestTemplate restTemplate = new RestTemplate();

		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "daee9b915edd1ee81fbf5c4d052cc98f");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("tid", kakaoPayReadyVO.getTid());
		params.add("partner_order_id", kakaoPayApprovalVO2.getPartner_order_id());
		params.add("partner_user_id", kakaoPayApprovalVO2.getPartner_user_id());
		params.add("pg_token", pg_token);
		params.add("total_amount", String.valueOf(kakaoPayApprovalVO2.getAmount().getTotal()));
		Map<String, String> param = new HashMap<String, String>();
		param.put("user_code", kakaoPayApprovalVO2.getUser_code());
		param.put("code", kakaoPayApprovalVO2.getCode());
		param.put("in", kakaoPayApprovalVO2.getCheckIn());
		param.put("out", kakaoPayApprovalVO2.getCheckOut());
		param.put("people", kakaoPayApprovalVO2.getPeople());
		
		/* mapper.insertACReservation(param); */
		
		

		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		try {
			kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body,
					KakaoPayApprovalVO.class);
			

			
			

			return kakaoPayApprovalVO;

		} catch (RestClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}
}