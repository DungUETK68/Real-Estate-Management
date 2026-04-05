package com.javaweb.controller.admin;



import com.javaweb.enums.District;
import com.javaweb.enums.TypeCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller(value="buildingControllerOfAdmin")
public class BuildingController {
    @Autowired
    private IUserService userService;

    @GetMapping(value="/admin/building-list")
    public ModelAndView buildingList(@ModelAttribute BuildingSearchRequest buildingSearchRequest, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/building/list");
        mav.addObject("modelSearch", buildingSearchRequest);
        mav.addObject("listDistricts", District.listDistricts());
        mav.addObject("listStaffs",userService.getStaffs());
        mav.addObject("listTypes", TypeCode.listTypes());
        //TODO: Xuong DB lay data (de thuc hien hien thi danh sach toa nha)
        List<BuildingSearchResponse> responseList = new ArrayList<>();
        BuildingSearchResponse item1 = new BuildingSearchResponse();
        item1.setId(3L);
        item1.setName("Landmark 81");
        item1.setAddress("Ho Chi Minh");
        item1.setNumberOfBasement(10L);
        item1.setManagerName("Phung Tien Dung");
        item1.setManagerPhone("0325561813");
        BuildingSearchResponse item2 = new BuildingSearchResponse();
        item2.setId(4L);
        item2.setName("Landmark 72");
        item2.setAddress("Ha Noi");
        item2.setNumberOfBasement(8L);
        item2.setManagerName("Phung Tien Dung");
        item2.setManagerPhone("0325561813");
        responseList.add(item1);
        responseList.add(item2);
        mav.addObject("buildingList", responseList);
        return mav;
    }

    @GetMapping(value="/admin/building-edit")
    public ModelAndView buildingEdit(@ModelAttribute BuildingDTO buildingDTO, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/building/edit");
        mav.addObject("listDistricts", District.listDistricts());
        mav.addObject("listTypes", TypeCode.listTypes());
        return mav;
    }

    @GetMapping(value="/admin/building-edit-{id}")
    public ModelAndView buildingEdit(@PathVariable("id") Long id, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/building/edit");
        //TODO: Xuong bd de tim building theo id de tra ra giao dien
        BuildingDTO buildingDTO = new BuildingDTO();
        buildingDTO.setId(id);
        buildingDTO.setName("Phung Tien Dung");
        mav.addObject("buildingEdit", buildingDTO);
        return mav;
    }
}
