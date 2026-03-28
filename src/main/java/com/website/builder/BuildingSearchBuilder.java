package com.website.builder;

import java.util.ArrayList;
import java.util.List;

public class BuildingSearchBuilder {
	private String name;
	private Long floorArea;
	private String ward;
	private String street;
	private String districtId;
	private Integer numberOfBasement;
	private List<String> typeCode = new ArrayList<>();
	private String managerName;
	private String managerPhoneNumber;
	private Long rentPrice1;
	private Long rentPrice2;
	private Long rentArea1;
	private Long rentArea2;
	private Long staffId;
	
	private BuildingSearchBuilder (Builder builder) {
		this.name = builder.name;
		this.floorArea = builder.floorArea;
		this.ward = builder.ward;
		this.street = builder.street;
		this.districtId = builder.districtId;
		this.numberOfBasement = builder.numberOfBasement;
		this.typeCode = builder.typeCode;
		this.managerName = builder.managerName;
		this.managerPhoneNumber = builder.managerPhoneNumber;
		this.rentPrice1 = builder.rentPrice1;
		this.rentPrice2 = builder.rentPrice2;
		this.rentArea1 = builder.rentArea1;
		this.rentArea2 = builder.rentArea2;
		this.staffId = builder.staffId;
		}
	
	public String getName() {
		return name;
	}
	public Long getFloorArea() {
		return floorArea;
	}
	public String getWard() {
		return ward;
	}
	public String getStreet() {
		return street;
	}
	public String getDistrictId() {
		return districtId;
	}
	public Integer getNumberOfBasement() {
		return numberOfBasement;
	}
	public List<String> getTypeCode() {
		return typeCode;
	}
	public String getManagerName() {
		return managerName;
	}
	public String getManagerPhoneNumber() {
		return managerPhoneNumber;
	}
	public Long getRentPrice1() {
		return rentPrice1;
	}
	public Long getRentPrice2() {
		return rentPrice2;
	}
	public Long getRentArea1() {
		return rentArea1;
	}
	public Long getRentArea2() {
		return rentArea2;
	}
	public Long getStaffId() {
		return staffId;
	}
	
	public static class Builder {
		private String name;
		private Long floorArea;
		private String ward;
		private String street;
		private String districtId;
		private Integer numberOfBasement;
		private List<String> typeCode = new ArrayList<>();
		private String managerName;
		private String managerPhoneNumber;
		private Long rentPrice1;
		private Long rentPrice2;
		private Long rentArea1;
		private Long rentArea2;
		private Long staffId;
		
		public Builder setName(String name) {
			this.name = name;
			return this;
		}
		public Builder setFloorArea(Long floorArea) {
			this.floorArea = floorArea;
			return this;
		}
		public Builder setWard(String ward) {
			this.ward = ward;
			return this;
		}
		public Builder setStreet(String street) {
			this.street = street;
			return this;
		}
		public Builder setDistrictId(String districtId) {
			this.districtId = districtId;
			return this;
		}
		public Builder setNumberOfBasement(Integer numberOfBasement) {
			this.numberOfBasement = numberOfBasement;
			return this;
		}
		public Builder setTypeCode(List<String> typeCode) {
			this.typeCode = typeCode;
			return this;
		}
		public Builder setManagerName(String managerName) {
			this.managerName = managerName;
			return this;
		}
		public Builder setManagerPhoneNumber(String managerPhoneNumber) {
			this.managerPhoneNumber = managerPhoneNumber;
			return this;
		}
		public Builder setRentPrice1(Long rentPrice1) {
			this.rentPrice1 = rentPrice1;
			return this;
		}
		public Builder setRentPrice2(Long rentPrice2) {
			this.rentPrice2 = rentPrice2;
			return this;
		}
		public Builder setRentArea1(Long rentArea1) {
			this.rentArea1 = rentArea1;
			return this;
		}
		public Builder setRentArea2(Long rentArea2) {
			this.rentArea2 = rentArea2;
			return this;
		}
		public Builder setStaffId(Long staffId) {
			this.staffId = staffId;
			return this;
		}
		
		public BuildingSearchBuilder build() {
			return new BuildingSearchBuilder(this);
		}
	}
}
