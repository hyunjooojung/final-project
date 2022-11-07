package fp.busan.parsing;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import fp.busan.mvc.destination.model.vo.Destination;
import fp.busan.mvc.festival.model.vo.Festival;
import fp.busan.mvc.kind.model.vo.Kind;
import fp.busan.mvc.restaurant.model.vo.Restaurant;
import fp.busan.mvc.room.model.vo.Room;


public class DBinsert {
	public static Connection conn = null;
	public static PreparedStatement pstmt = null;
	public static ResultSet rs = null;

	public static String driverClass = "oracle.jdbc.OracleDriver";
	public static String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	public static String user = "finalP";
	public static String password = "finalP";
	static OpenApiManager api = new OpenApiManager();

	

	public static void insertDestination() {
		List<Destination> deList = api.destinationListByXML();  
		
		int count = deList.size();
		while(count!=0) {
			try {

				Class.forName(driverClass);
				conn = DriverManager.getConnection(url, user, password);

				conn.setAutoCommit(false);
				for (int i = 0; i < deList.size(); i++) {
					String sql = "INSERT INTO Destination(DE_ID,NAME,GUGUNNM,LAT,LNG,PLACE,TITLE,SUBTITLE,ADDR,TEL,HOMEPAGE,TRFCINFO,USAGEDAY,HLDYINFO,USAGE_DAY_WEEK,AMOUNT,MIDDLE_SIZE_RM,IMG,THUMB,detail) "
							+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, deList.get(i).getDe_id());
					pstmt.setString(2, deList.get(i).getName());
					pstmt.setString(3, deList.get(i).getGugunnm());
					pstmt.setString(4, deList.get(i).getLat());
					pstmt.setString(5, deList.get(i).getLng());
					pstmt.setString(6, deList.get(i).getPlace());
					pstmt.setString(7, deList.get(i).getTitle());
					pstmt.setString(8, deList.get(i).getSubtitle());
					pstmt.setString(9, deList.get(i).getAddr());
					pstmt.setString(10, deList.get(i).getTel());
					pstmt.setString(11, deList.get(i).getHomepage());
					pstmt.setString(12, deList.get(i).getTrfcinfo());
					pstmt.setString(13, deList.get(i).getUsageday());
					pstmt.setString(14, deList.get(i).getHldyinfo());
					pstmt.setString(15, deList.get(i).getUsage_day_week());
					pstmt.setString(16, deList.get(i).getAmount());
					pstmt.setString(17, deList.get(i).getMiddle_size_rm());
					pstmt.setString(18, deList.get(i).getImg());
					pstmt.setString(19, deList.get(i).getThumb());
					pstmt.setString(20, deList.get(i).getDetail());

					pstmt.executeUpdate();
					deList.remove(i);
					conn.commit();
					count--;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null && rs.isClosed() == false) {
						rs.close();
					}

					if (pstmt != null && pstmt.isClosed() == false) {
						pstmt.close();
					}

					if (conn != null && conn.isClosed() == false) {
						conn.close();
					}
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
		
	}
	
	
	public static void insertFestival() {
		List<Festival> deList = api.festivalListByXML();  
		
		int count = deList.size();
		while(count!=0) {
			try {

				Class.forName(driverClass);
				conn = DriverManager.getConnection(url, user, password);

				conn.setAutoCommit(false);
				for (int i = 0; i < deList.size(); i++) {
					String sql = "INSERT INTO Festival(fe_id,fe_TITLE,GUGUNNM,LAT,LNG,PLACE,TITLE,SUBTITLE,MAIN_PLACE,ADDR1,ADDR2,TEL,HOMEPAGE,TRFCINFO,TIME,AMOUNT,IMG,IMG_THUMB,detail,MIDDLE_SIZE_RM1,READCOUNT,registration)"
							+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, deList.get(i).getFe_id());
					pstmt.setString(2, deList.get(i).getFe_title());
					pstmt.setString(3, deList.get(i).getGugunnm());
					pstmt.setString(4, deList.get(i).getLat());
					pstmt.setString(5, deList.get(i).getLng());
					pstmt.setString(6, deList.get(i).getPlace());
					pstmt.setString(7, deList.get(i).getTitle());
					pstmt.setString(8, deList.get(i).getSubtitle());
					pstmt.setString(9, deList.get(i).getMain_place());
					pstmt.setString(10, deList.get(i).getAddr1());
					pstmt.setString(11, deList.get(i).getAddr2());
					pstmt.setString(12, deList.get(i).getTel());
					pstmt.setString(13, deList.get(i).getHomepage());
					pstmt.setString(14, deList.get(i).getTrfcinfo());
					pstmt.setString(15, deList.get(i).getTime());
					pstmt.setString(16, deList.get(i).getAmount());
					pstmt.setString(17, deList.get(i).getImg());
					pstmt.setString(18, deList.get(i).getImg_thumb());
					pstmt.setString(19, deList.get(i).getDetail());
					pstmt.setString(20, deList.get(i).getMiddle_size_rm1());
					pstmt.setInt(21, deList.get(i).getReadcount());

					pstmt.executeUpdate();
					deList.remove(i);
					conn.commit();
					count--;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null && rs.isClosed() == false) {
						rs.close();
					}

					if (pstmt != null && pstmt.isClosed() == false) {
						pstmt.close();
					}

					if (conn != null && conn.isClosed() == false) {
						conn.close();
					}
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
		
	}
	
	
	public static void insertKind() {
		List<Kind> deList = api.kindListByXML();  
		
		int count = deList.size();
		while(count!=0) {
			try {

				Class.forName(driverClass);
				conn = DriverManager.getConnection(url, user, password);

				conn.setAutoCommit(false);
				for (int i = 0; i < deList.size(); i++) {
					String sql = "INSERT INTO Kind(Kind_ID,KIND_NAME,CEONAME,adress,tel,cnCode,cn,localeA,localeCode,kind_content,parking,bsnTime,img1,img2,cnt) "
							+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, deList.get(i).getKind_id());
					pstmt.setString(2, deList.get(i).getKind_name());
					pstmt.setString(3, deList.get(i).getCeoname());
					pstmt.setString(4, deList.get(i).getAdress());
					pstmt.setString(5, deList.get(i).getTel());
					pstmt.setString(6, deList.get(i).getCncode());
					pstmt.setString(7, deList.get(i).getCn());
					pstmt.setString(8, deList.get(i).getLocalea());
					pstmt.setString(9, deList.get(i).getLocalecode());
					pstmt.setString(10, deList.get(i).getKind_content());
					pstmt.setString(11, deList.get(i).getParking());
					pstmt.setString(12, deList.get(i).getBsntime());
					pstmt.setString(13, deList.get(i).getImg1());
					pstmt.setString(14, deList.get(i).getImg2());
					pstmt.setInt(15, deList.get(i).getCnt());

					pstmt.executeUpdate();
					deList.remove(i);
					conn.commit();
					count--;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null && rs.isClosed() == false) {
						rs.close();
					}

					if (pstmt != null && pstmt.isClosed() == false) {
						pstmt.close();
					}

					if (conn != null && conn.isClosed() == false) {
						conn.close();
					}
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
		
	}
	
	
	public static void insertRestaurant() {
		List<Restaurant> deList = api.resListByXML();  
		
		int count = deList.size();
		while(count!=0) {
			try {

				Class.forName(driverClass);
				conn = DriverManager.getConnection(url, user, password);

				conn.setAutoCommit(false);
				for (int i = 0; i < deList.size(); i++) {
					String sql = "INSERT INTO Restaurant(res_id,res_name,GUGUNNM,LAT,LNG,PLACE,ADDR,TEL,HOMEPAGE,TIME,IMG,IMG_THUMB,detail,price,READCOUNT,registration) "
							+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate) ";
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, deList.get(i).getRes_id());
					pstmt.setString(2, deList.get(i).getRes_name());
					pstmt.setString(3, deList.get(i).getGugunnm());
					pstmt.setString(4, deList.get(i).getLat());
					pstmt.setString(5, deList.get(i).getLng());
					pstmt.setString(6, deList.get(i).getPlace());
					pstmt.setString(7, deList.get(i).getAddr());
					pstmt.setString(8, deList.get(i).getTel());
					pstmt.setString(9, deList.get(i).getHomepage());
					pstmt.setString(10, deList.get(i).getTime());
					pstmt.setString(11, deList.get(i).getImg());
					pstmt.setString(12, deList.get(i).getImg_thumb());
					pstmt.setString(13, deList.get(i).getDetail());
					pstmt.setInt(14, deList.get(i).getPrice());
					pstmt.setInt(15, deList.get(i).getReadcount());

					pstmt.executeUpdate();
					deList.remove(i);
					conn.commit();
					count--;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null && rs.isClosed() == false) {
						rs.close();
					}

					if (pstmt != null && pstmt.isClosed() == false) {
						pstmt.close();
					}

					if (conn != null && conn.isClosed() == false) {
						conn.close();
					}
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
		
	}

	
	public static void insertRoom() {
		List<Room> deList = api.roomListByXML();  
		
		int count = deList.size();
		while(count!=0) {
			try {

				Class.forName(driverClass);
				conn = DriverManager.getConnection(url, user, password);

				conn.setAutoCommit(false);
				for (int i = 0; i < deList.size(); i++) {
					String sql = "INSERT INTO Room(CODE,NAME,ADRESS,READCOUNT,LOCALCODE,TEL,IMAGE,IMAGE2,mapx,mapy,PRICE) "
							+ "VALUES(?,?,?,?,?,?,?,?,?,?,?) ";
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, deList.get(i).getCode());
					pstmt.setString(2, deList.get(i).getName());
					pstmt.setString(3, deList.get(i).getAdress());
					pstmt.setString(4, deList.get(i).getReadcount());
					pstmt.setString(5, deList.get(i).getLocalcode());
					pstmt.setString(6, deList.get(i).getTel());
					pstmt.setString(7, deList.get(i).getImage());
					pstmt.setString(8, deList.get(i).getImage2());
					pstmt.setString(9, deList.get(i).getMapx());
					pstmt.setString(10, deList.get(i).getMapy());
					pstmt.setInt(11, deList.get(i).getPrice());

					pstmt.executeUpdate();
					deList.remove(i);
					conn.commit();
					count--;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null && rs.isClosed() == false) {
						rs.close();
					}

					if (pstmt != null && pstmt.isClosed() == false) {
						pstmt.close();
					}

					if (conn != null && conn.isClosed() == false) {
						conn.close();
					}
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
		
	}
	public static void main(String[] args) throws SQLException {
		
		
		insertDestination();//성공

		insertFestival();  	//성공
		
		insertKind();		//오류문이 나오기는 합니다 당황하지 마시고 무시하면 됩니다! 확인 sql에서 해주세요!
		
		insertRestaurant(); //성공
		
		insertRoom();		//성공
	}
}
