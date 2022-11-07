package fp.busan.parsing;

import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import fp.busan.mvc.destination.model.vo.Destination;
import fp.busan.mvc.festival.model.vo.Festival;
import fp.busan.mvc.kind.model.vo.Kind;
import fp.busan.mvc.restaurant.model.vo.Restaurant;
import fp.busan.mvc.room.model.vo.Room;

public class OpenApiManager {
	public static final String KEY = "hXvTFCgWbasAlMKVcIhjaxQh5zRAtojHHpnP0Steh8CC%2F39X06RCfbSqpx5vYB1aVwR9ynRDKohSo4jJ%2BTfLmw%3D%3D";
	public static final String RE_KEY = "XLl3OZaBCSpLl%2BYFTAbqfmwWNVnKx4KIZzzA8CnzEpM5XO8eikZQJ6%2BdJztkLRCxzv6IKYByw9a6BJmk0d0Yww%3D%3D";
	public static final String ROOM_KEY = "XLl3OZaBCSpLl%2BYFTAbqfmwWNVnKx4KIZzzA8CnzEpM5XO8eikZQJ6%2BdJztkLRCxzv6IKYByw9a6BJmk0d0Yww%3D%3D";

	
	public static final SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	
		public static void main(String[] args) {
//			OpenApiManager.destinationListByXML();
//			OpenApiManager.festivalListByXML();
//			OpenApiManager.kindListByXML();
//			OpenApiManager.resListByXML();
			OpenApiManager.roomListByXML();
		}
		
		public static List<Destination> destinationListByXML() {
			List<Destination> list = new ArrayList<Destination>();
			try {
			
			StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/6260000/AttractionService/getAttractionKr");
			urlBuilder.append("?" + "ServiceKey=" + KEY); // 첫 번째만 물음표로 설정
			urlBuilder.append("&" + "pageNo=" + 1);
			urlBuilder.append("&" + "numOfRows=" + 150);
			
			System.out.println(urlBuilder);
			
			URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/xml");
	        
	        int code = conn.getResponseCode();
	        System.out.println("Response code: " + code);
				
//				if(code < 200 || code > 300) {
//					System.out.println("페이지가 잘못되었습니다.");
//					return null;
//				}
//				
				// 3. 페이지 Parsing(해석) 
				DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
				DocumentBuilder db = dbf.newDocumentBuilder();
				 
				Document doc = db.parse(conn.getInputStream()); // xml 부를 파싱하여 객체화
				
				doc.getDocumentElement().normalize();
				
				System.out.println("Root Element : " + doc.getDocumentElement().getNodeName());
				System.out.println("======================================================");

				System.out.println("resultCode : "+doc.getElementsByTagName("resultCode").item(0).getTextContent());  
				System.out.println("resultMsg : "+doc.getElementsByTagName("resultMsg").item(0).getTextContent());

				NodeList nList = doc.getElementsByTagName("item");
				for(int i = 0; i < nList.getLength(); i++) {
					Node node = nList.item(i);
					System.out.println("\nCurrent Element : " + node.getNodeName());
					if(node.getNodeType() == Node.ELEMENT_NODE) {
						try {
							Element eElement = (Element) node;

							//여기부터 바꾸면됨
							
							int DE_ID = i;
							String NAME = getStrData(eElement, "MAIN_TITLE");
							String GUGUNNM = getStrData(eElement, "GUGUN_NM");
							String LAT = getStrData(eElement, "LAT");
							String LNG = getStrData(eElement, "LNG");
							String PLACE = getStrData(eElement, "PLACE");
							String TITLE = getStrData(eElement, "TITLE");
							String SUBTITLE = getStrData(eElement, "SUBTITLE");
							String ADDR = getStrData(eElement, "ADDR1");
							String TEL = getStrData(eElement, "CNTCT_TEL");
							String HOMEPAGE = getStrData(eElement, "HOMEPAGE_URL");
							String TRFCINFO = getStrData(eElement, "TRFC_INFO");
							String USAGEDAY = getStrData(eElement, "USAGE_DAY");
							String HLDYINFO = getStrData(eElement, "HLDY_INFO");
							String USAGE_DAY_WEEK = getStrData(eElement, "USAGE_DAY_WEEK_AND_TIME");
							String AMOUNT = getStrData(eElement, "USAGE_AMOUNT");
							String MIDDLE_SIZE_RM = getStrData(eElement, "MIDDLE_SIZE_RM1");
							String IMG = getStrData(eElement, "MAIN_IMG_NORMAL");
							String THUMB = getStrData(eElement, "MAIN_IMG_THUMB");
							String DETAIL = getStrData(eElement, "ITEMCNTNTS");
							Destination destination = new Destination(DE_ID, NAME, GUGUNNM, LAT, LNG, PLACE, TITLE, SUBTITLE, ADDR, TEL, HOMEPAGE, TRFCINFO, USAGEDAY, HLDYINFO, USAGE_DAY_WEEK, AMOUNT, MIDDLE_SIZE_RM, IMG, THUMB, DETAIL, 0); 
							list.add(destination);
							System.out.println(list.get(i));
						} catch (Exception e){
							System.out.println("데이터가 잘못되었습니다!");
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return list;
		}
		
		public static List<Festival> festivalListByXML() {
			List<Festival> list = new ArrayList<Festival>();
			try {
			
			StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/6260000/FestivalService/getFestivalKr");
			urlBuilder.append("?" + "ServiceKey=" + KEY); // 첫 번째만 물음표로 설정
			urlBuilder.append("&" + "pageNo=" + 1);
			urlBuilder.append("&" + "numOfRows=" + 30);
			
			System.out.println(urlBuilder);
			
			URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/xml");
	        
	        int code = conn.getResponseCode();
	        System.out.println("Response code: " + code);
				
//				if(code < 200 || code > 300) {
//					System.out.println("페이지가 잘못되었습니다.");
//					return null;
//				}
//				
				// 3. 페이지 Parsing(해석) 
				DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
				DocumentBuilder db = dbf.newDocumentBuilder();
				 
				Document doc = db.parse(conn.getInputStream()); // xml 부를 파싱하여 객체화
				
				doc.getDocumentElement().normalize();
				
				System.out.println("Root Element : " + doc.getDocumentElement().getNodeName());
				System.out.println("======================================================");

				System.out.println("resultCode : "+doc.getElementsByTagName("resultCode").item(0).getTextContent());  
				System.out.println("resultMsg : "+doc.getElementsByTagName("resultMsg").item(0).getTextContent());

				NodeList nList = doc.getElementsByTagName("item");
				for(int i = 0; i < nList.getLength(); i++) {
					Node node = nList.item(i);
					System.out.println("\nCurrent Element : " + node.getNodeName());
					if(node.getNodeType() == Node.ELEMENT_NODE) {
						try {
							Element eElement = (Element) node;

							//여기부터 바꾸면됨
							
							int fe_id = getIntData(eElement, "UC_SEQ");
							String fe_title = getStrData(eElement, "MAIN_TITLE");
							String gugunnm = getStrData(eElement, "GUGUN_NM");
							String lat = getStrData(eElement, "LAT");
							String lng = getStrData(eElement, "LNG");
							String place = getStrData(eElement, "PLACE");
							String title = getStrData(eElement, "TITLE");
							String subtitle = getStrData(eElement, "SUBTITLE");
							String main_place = getStrData(eElement, "MAIN_PLACE");
							String addr1 = getStrData(eElement, "ADDR1");
							String addr2 = getStrData(eElement, "ADDR2");
							String tel = getStrData(eElement, "CNTCT_TEL");
							String homepage = getStrData(eElement, "HOMEPAGE_URL");
							String trfcinfo = getStrData(eElement, "TRFC_INFO");
							String time = getStrData(eElement, "USAGE_DAY_WEEK_AND_TIME");
							String amount = getStrData(eElement, "USAGE_AMOUNT");
							String img = getStrData(eElement, "MAIN_IMG_NORMAL");
							String img_thumb = getStrData(eElement, "MAIN_IMG_THUMB");
							String detail = getStrData(eElement, "ITEMCNTNTS");
							String middle_size_rm1 = getStrData(eElement, "MIDDLE_SIZE_RM1");
							Festival festival = new Festival(fe_id, fe_title, gugunnm, lat, lng, place, title, subtitle, main_place, addr1, addr2, tel, homepage, trfcinfo, time, amount, img, img_thumb, detail, middle_size_rm1,0); 
							list.add(festival);
							System.out.println(list.get(i));
						} catch (Exception e){
							System.out.println("데이터가 잘못되었습니다!");
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return list;
		}
		
		public static List<Kind> kindListByXML() {
			List<Kind> list = new ArrayList<Kind>();
			try {
			
			StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/6260000/GoodPriceStoreService/getGoodPriceStore");
			urlBuilder.append("?" + "ServiceKey=" + KEY); // 첫 번째만 물음표로 설정
			urlBuilder.append("&" + "pageNo=" + 1);
			urlBuilder.append("&" + "numOfRows=" +637);
			
			System.out.println(urlBuilder);
			
			URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/xml");
	        
	        int code = conn.getResponseCode();
	        System.out.println("Response code: " + code);
				
//				if(code < 200 || code > 300) {
//					System.out.println("페이지가 잘못되었습니다.");
//					return null;
//				}
//				
				// 3. 페이지 Parsing(해석) 
				DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
				DocumentBuilder db = dbf.newDocumentBuilder();
				 
				Document doc = db.parse(conn.getInputStream()); // xml 부를 파싱하여 객체화
				
				doc.getDocumentElement().normalize();
				
				System.out.println("Root Element : " + doc.getDocumentElement().getNodeName());
				System.out.println("======================================================");

				System.out.println("resultCode : "+doc.getElementsByTagName("resultCode").item(0).getTextContent());  
				System.out.println("resultMsg : "+doc.getElementsByTagName("resultMsg").item(0).getTextContent());

				NodeList nList = doc.getElementsByTagName("item");
				for(int i = 0; i < nList.getLength(); i++) {
					Node node = nList.item(i);
					System.out.println("\nCurrent Element : " + node.getNodeName());
					if(node.getNodeType() == Node.ELEMENT_NODE) {
						try {
							Element eElement = (Element) node;

							//여기부터 바꾸면됨
							
							int kind_id = getIntData(eElement, "idx");
							String kind_name = getStrData(eElement, "sj");
							String ceoname = getStrData(eElement, "mNm");
							String adress = getStrData(eElement, "adres");
							String tel = getStrData(eElement, "tel");
							String cncode = getStrData(eElement, "cnCd");
							String cn = getStrData(eElement, "cn");
							String localea = getStrData(eElement, "locale");
							String localecode = getStrData(eElement, "localeCd");
							String kind_content = getStrData(eElement, "intrcn");
							String parking = getStrData(eElement, "parkngAt");
							String bsntime = getStrData(eElement, "bsnTime");
							String img1 = getStrData(eElement, "imgFile1");
							String img2 = getStrData(eElement, "imgFile2");
							Kind kind = new Kind(kind_id, kind_name, ceoname, adress, tel, cncode, cn, localea, localecode, kind_content, parking, bsntime, img1, img2, 0); 
							list.add(kind);
							System.out.println(list.get(i));
						} catch (Exception e){
							System.out.println("데이터가 잘못되었습니다!");
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return list;
		}
		
		public static List<Restaurant> resListByXML() {
			List<Restaurant> list = new ArrayList<Restaurant>();
			try {
			
			StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/6260000/FoodService/getFoodKr");
			urlBuilder.append("?" + "ServiceKey=" + RE_KEY); // 첫 번째만 물음표로 설정
			urlBuilder.append("&" + "pageNo=" + 1);
			urlBuilder.append("&" + "numOfRows=" +150);
			
			System.out.println(urlBuilder);
			
			URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/xml");
	        
	        int code = conn.getResponseCode();
	        System.out.println("Response code: " + code);
				
//				if(code < 200 || code > 300) {
//					System.out.println("페이지가 잘못되었습니다.");
//					return null;
//				}
//				
				// 3. 페이지 Parsing(해석) 
				DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
				DocumentBuilder db = dbf.newDocumentBuilder();
				 
				Document doc = db.parse(conn.getInputStream()); // xml 부를 파싱하여 객체화
				
				doc.getDocumentElement().normalize();
				
				System.out.println("Root Element : " + doc.getDocumentElement().getNodeName());
				System.out.println("======================================================");

				System.out.println("resultCode : "+doc.getElementsByTagName("resultCode").item(0).getTextContent());  
				System.out.println("resultMsg : "+doc.getElementsByTagName("resultMsg").item(0).getTextContent());

				NodeList nList = doc.getElementsByTagName("item");
				for(int i = 0; i < nList.getLength(); i++) {
					Node node = nList.item(i);
					System.out.println("\nCurrent Element : " + node.getNodeName());
					if(node.getNodeType() == Node.ELEMENT_NODE) {
						try {
							Element eElement = (Element) node;

							//여기부터 바꾸면됨
							
							int res_id = getIntData(eElement, "UC_SEQ");
							String res_name = getStrData(eElement, "MAIN_TITLE");
							String gugunnm = getStrData(eElement, "GUGUN_NM");
							String lat = getStrData(eElement, "LAT");
							String lng = getStrData(eElement, "LNG");
							String place = getStrData(eElement, "PLACE");
							String addr = getStrData(eElement, "ADDR1");
							String tel = getStrData(eElement, "CNTCT_TEL");
							String homepage = getStrData(eElement, "HOMEPAGE_URL");
							String time = getStrData(eElement, "USAGE_DAY_WEEK_AND_TIME");
							String img = getStrData(eElement, "MAIN_IMG_NORMAL");
							String img_thumb = getStrData(eElement, "MAIN_IMG_THUMB");
							String detail = getStrData(eElement, "ITEMCNTNTS");
							int price = 10000+i*600;
							int readcount=0;
							Restaurant restaurant = new Restaurant(res_id, res_name, gugunnm, lat, lng, place, addr, tel, homepage, time, img,img_thumb, detail,price,readcount); 
							list.add(restaurant);
							System.out.println(list.get(i));
						} catch (Exception e){
							System.out.println("데이터가 잘못되었습니다!");
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return list;
		}
		
		
		public static List<Room> roomListByXML() {
			List<Room> list = new ArrayList<Room>();
			try {
			
				StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay");
				urlBuilder.append("?" + "ServiceKey=" + ROOM_KEY); // 첫 번째만 물음표로 설정
				urlBuilder.append("&" + "numOfRows=" + 134);
				urlBuilder.append("&" + "pageNo=" + 1);
				urlBuilder.append("&" + "MobileOS=" + "ETC");
				urlBuilder.append("&" + "MobileApp=" + "AppTest");
				urlBuilder.append("&" + "arrange=" + "A");
				urlBuilder.append("&" + "listYN=" + "Y");
				urlBuilder.append("&" + "areaCode=" + 6);
			
			System.out.println(urlBuilder);
			
			URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/xml");
	        
	        int code = conn.getResponseCode();
	        System.out.println("Response code: " + code);
				
//				if(code < 200 || code > 300) {
//					System.out.println("페이지가 잘못되었습니다.");
//					return null;
//				}
//				
				// 3. 페이지 Parsing(해석) 
				DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
				DocumentBuilder db = dbf.newDocumentBuilder();
				 
				Document doc = db.parse(conn.getInputStream()); // xml 부를 파싱하여 객체화
				
				doc.getDocumentElement().normalize();
				
				System.out.println("Root Element : " + doc.getDocumentElement().getNodeName());
				System.out.println("======================================================");

				System.out.println("resultCode : "+doc.getElementsByTagName("resultCode").item(0).getTextContent());  
				System.out.println("resultMsg : "+doc.getElementsByTagName("resultMsg").item(0).getTextContent());

				NodeList nList = doc.getElementsByTagName("item");
				for(int i = 0; i < nList.getLength(); i++) {
					Node node = nList.item(i);
					System.out.println("\nCurrent Element : " + node.getNodeName());
					if(node.getNodeType() == Node.ELEMENT_NODE) {
						try {
							Element eElement = (Element) node;

							//여기부터 바꾸면됨
							
							int CODE = getIntData(eElement, "contentid");
							String NAME = getStrData(eElement, "title");
							String ADRESS = getStrData(eElement, "addr1");
							String READCOUNT = getStrData(eElement, "readcount");
							String LOCALCODE = getStrData(eElement, "areacode");
							String TEL = getStrData(eElement, "tel");
							String IMAGE = getStrData(eElement, "firstimage");
							String IMAGE2 = getStrData(eElement, "firstimage2");
							String mapx = getStrData(eElement, "mapx");
							String mapy = getStrData(eElement, "mapy");
							int PRICE = 10000+i*500;
							
							Room room = new Room(CODE, NAME, ADRESS, READCOUNT, LOCALCODE, TEL, IMAGE, IMAGE2, mapx, mapy, PRICE); 
							list.add(room);
							System.out.println(list.get(i));
						} catch (Exception e){
							System.out.println("데이터가 잘못되었습니다!");
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return list;
		}
		
		private static String getStrData(Element eElement, String tagName){
			try {
				return eElement.getElementsByTagName(tagName).item(0).getTextContent();
			} catch (Exception e) {
				return "-";
			}
		}
		
		private static int getIntData(Element eElement, String tagName){
			try {
				return Integer.parseInt(eElement.getElementsByTagName(tagName).item(0).getTextContent());
			} catch (Exception e) {
				return 0;
			}
		}
		
		private static long getLogData(Element eElement, String tagName){
			try {
				return Long.parseLong(eElement.getElementsByTagName(tagName).item(0).getTextContent());
			} catch (Exception e) {
				return 0;
			}
		}
		
		private static double getDoubleData(Element eElement, String tagName){
			try {
				return Double.parseDouble(eElement.getElementsByTagName(tagName).item(0).getTextContent());
			} catch (Exception e) {
				return 0.0;
			}
		}
		
		private static Date getDateData(Element eElement, String tagName){
			try {
				Date date = sdf.parse(eElement.getElementsByTagName(tagName).item(0).getTextContent());
				return new java.sql.Date(date.getTime());
			} catch (Exception e) {
				return null;
			}
		}
		
		
}
