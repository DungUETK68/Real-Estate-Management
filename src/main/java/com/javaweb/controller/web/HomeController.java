package com.javaweb.controller.web;

import com.javaweb.entity.elasticsearch.BuildingDocument;
import com.javaweb.enums.District;
import com.javaweb.enums.TypeCode;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.elasticsearch.BuildingSearchRepository;
import com.javaweb.service.IBuildingService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Controller(value = "homeControllerOfWeb")
public class HomeController {

    @Autowired
    private IBuildingService buildingService;

    @Autowired
    private BuildingSearchRepository buildingSearchRepository;

    @Autowired
    private ModelMapper modelMapper;

	@RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
	public ModelAndView homePage(BuildingSearchRequest buildingSearchRequest, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("web/home");
        mav.addObject("modelSearch", buildingSearchRequest);
        mav.addObject("listDistricts", District.listDistricts());
        mav.addObject("listTypes", TypeCode.listTypes());
        
        List<BuildingSearchResponse> buildings;
        if (buildingSearchRequest.getName() != null && !buildingSearchRequest.getName().isEmpty()) {
            // Tìm kiếm bằng Elasticsearch
            List<BuildingDocument> docs = buildingSearchRepository.findByNameContaining(buildingSearchRequest.getName());
            buildings = docs.stream()
                    .map(doc -> modelMapper.map(doc, BuildingSearchResponse.class))
                    .collect(Collectors.toList());
        } else {
            // Fallback về database truyền thống hoặc lấy mặc định
            buildings = buildingService.findAll(buildingSearchRequest, PageRequest.of(0, 6));
        }
        
        mav.addObject("buildings", buildings);
		return mav;
	}

    @GetMapping(value="/gioi-thieu")
    public ModelAndView introducceBuiding(){
        ModelAndView mav = new ModelAndView("web/introduce");
        return mav;
    }

    @GetMapping(value="/san-pham")
    public ModelAndView buidingList(BuildingSearchRequest buildingSearchRequest){
        ModelAndView mav = new ModelAndView("/web/list");
        mav.addObject("modelSearch", buildingSearchRequest);
        mav.addObject("listDistricts", District.listDistricts());
        mav.addObject("listTypes", TypeCode.listTypes());
        List<BuildingSearchResponse> buildings = buildingService.findAll(buildingSearchRequest, PageRequest.of(0, 20));
        mav.addObject("buildings", buildings);
        return mav;
    }

    @GetMapping(value="/chi-tiet-san-pham")
    public ModelAndView buildingDetail(@org.springframework.web.bind.annotation.RequestParam(value="id", required=true) Long id){
        ModelAndView mav = new ModelAndView("/web/detail");
        com.javaweb.model.dto.BuildingDTO building = buildingService.findById(id);
        java.util.Map<String, String> districtsMap = com.javaweb.enums.District.listDistricts();
        if (building.getDistrict() != null && districtsMap.containsKey(building.getDistrict())) {
            building.setDistrict(districtsMap.get(building.getDistrict()));
        }
        mav.addObject("building", building);
        return mav;
    }

    @GetMapping(value="/tin-tuc")
    public ModelAndView news(){
        ModelAndView mav = new ModelAndView("/web/news");
        return mav;
    }

    @GetMapping(value="/lien-he")
    public ModelAndView contact(){
        ModelAndView mav = new ModelAndView("/web/contact");
        return mav;
    }

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView("login");
		return mav;
	}

	@RequestMapping(value = "/access-denied", method = RequestMethod.GET)
	public ModelAndView accessDenied() {
		return new ModelAndView("redirect:/login?accessDenied");
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return new ModelAndView("redirect:/trang-chu");
	}
}
