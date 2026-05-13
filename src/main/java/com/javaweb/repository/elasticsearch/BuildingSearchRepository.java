package com.javaweb.repository.elasticsearch;

import com.javaweb.entity.elasticsearch.BuildingDocument;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import java.util.List;

public interface BuildingSearchRepository extends ElasticsearchRepository<BuildingDocument, Long> {
    
    List<BuildingDocument> findByNameContaining(String name);
    
    List<BuildingDocument> findByAddressContaining(String address);
}
