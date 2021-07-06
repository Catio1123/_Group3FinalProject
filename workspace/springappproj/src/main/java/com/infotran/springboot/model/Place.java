package com.infotran.springboot.model;

import java.sql.Blob;
import java.sql.Clob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.infotran.springboot.utils.SystemUtils;

@Entity
@Table(name="Place_Spring")
public class Place {
	
	
	//我們跟hibernate要Place, 他會自動幫我們抓RestaurantType
	//不一定要雙向:Place 跟 RestaurantType 互相找
	
	//
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="typeId_0623")
	RestaurantType type;
	
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    Long    placeId;
	
	@Column(name = "typeId_0623", insertable = false, updatable = false)
	Integer typeId;
	@Transient
	String typeName;
	String  name;
	String  phone;
	String  address;
	Double  longitude;
	Double  latitude;
	String  link;
	String  mimeType;
	
	@JsonIgnore
	Clob  	comment;
	// Clob = 大量的文字資料
	
	
	//在轉成json的過程中會被忽略，前端如果要讀的話要傳回去
	@JsonIgnore	
	//把Blob物件轉乘data:...傳入pictureString
	//把他轉換成位元組陣列，傳入一般的java類別pictureString
	//  stores a Binary Large Object as a column value 
	Blob  	picture;
	
	//告訴hibernate不要將這個變數做成表格的欄位
	@Transient		//短暫，臨時		Persistence:永續儲存
	String pictureString; //data:image/gif;base64....
	
	@Transient
	MultipartFile placeImage;
	

	public Place() {
	}
	
	public Place(Integer typeId, String name, String phone, String address, Double longitude, Double latitude,
			String link, Blob blob, Clob clob, String mimeType) {
		super();
		this.typeId = typeId;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.longitude = longitude;
		this.latitude = latitude;
		this.link = link;
		this.picture = blob;
		this.comment = clob;
		this.mimeType = mimeType;
	}

	
	
	public RestaurantType getType() {
		return type;
	}

	public void setType(RestaurantType type) {
		this.type = type;
	}

	public MultipartFile getPlaceImage() {
		return placeImage;
	}

	public void setPlaceImage(MultipartFile placeImage) {
		this.placeImage = placeImage;
	}

	public String getMimeType() {
		return mimeType;
	}

	public void setMimeType(String mimeType) {
		this.mimeType = mimeType;
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	
	//ch03 Controller
	//應該把下面這些程式碼放到一個類別，呼叫就可以
	public String getPictureString() {
		
		return SystemUtils.blobToDataProtocol(mimeType, picture);
		//StringBuffer -> 比字串相加更好的方式
		//StringBuffer -> append, 可以回收
		//data:[mimeType];base64,xxxxxxxxxxxx
//		StringBuffer result = new StringBuffer("data:" + mimeType + ";base64,");
//		try(
//			InputStream is = picture.getBinaryStream();
//			ByteArrayOutputStream baos = new ByteArrayOutputStream();
//		){
//			
//			int len = 0;
//			byte[] b = new byte[81920]; //512的整數即可
//			while ((len = is.read(b)) != -1) {
//				baos.write(b, 0, len); //此敘述的口訣: A.O.L.
//			}
//			byte[] bytes = baos.toByteArray();
//			//Encoder是Base64裡面的一個內部類別(static class) -> 不能單獨寫
//			Base64.Encoder be = Base64.getEncoder();
//			
			//be.encode(bytes))-> 將圖片檔轉出來的位元組陣列(bytes)轉成base64的編碼
//			result.append(new String(be.encode(bytes)));
//			
		//如果上述不懂可用下方方式寫: 
////			byte[] ba = be.encode(bytes);
////			String tmp = new String(ba,"UTF-8");
////			result.append(tmp);
////			
//			
//			
//			//解碼成位元組陣列
////			byte[] decoded = Base64.getDecoder().decode(data);
//			//將位元組陣列轉為字串
////			result += new String(decoded, "UTF-8"); //Dati8t
//		}
//		
//		catch(Exception e) {
//			e.printStackTrace();
//		}
//		
//		
//		return result.toString();
	}
	
	public void setPictureString(String pictureString) {
		this.pictureString = pictureString;
	}


	public Clob getComment() {
		return comment;
	}

	public void setComment(Clob comment) {
		this.comment = comment;
	}

	public Blob getPicture() {
		return picture;
	}

	public void setPicture(Blob picture) {
		this.picture = picture;
	}

	
	
	public Long getPlaceId() {
		return placeId;
	}
	public void setPlaceId(Long placeId) {
		this.placeId = placeId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Double getLongitude() {
		return longitude;
	}
	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}
	public Double getLatitude() {
		return latitude;
	}
	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Place [placeId=");
		builder.append(placeId);
		builder.append(", name=");
		builder.append(name);
		builder.append(", phone=");
		builder.append(phone);
		builder.append(", address=");
		builder.append(address);
		builder.append(", longitude=");
		builder.append(longitude);
		builder.append(", latitude=");
		builder.append(latitude);
		builder.append(", link=");
		builder.append(link);
		builder.append(", hashcode]" + hashCode());
		return builder.toString();
	}

	public String getTypeName() {
		if(this.type != null) {
			
			return this.type.getTypeName();
		}
		return null;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	
//	+ "(placeId int NOT NULL AUTO_INCREMENT Primary Key , "
//			+ " typeId		int, " 
//			+ " name    	varchar(32), " 
//			+ " phone		varchar(50), "
//			+ " address		varchar(50), " 
//			+ " longitude	float, " 
//			+ " latitude	float, "
//			+ " link 		varchar(200) " 
//			+ " ) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci; ";
	
	


}
