package com.example.api_flutter.service;

import com.example.api_flutter.entiti.Place;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class PlaceService {

    @Autowired

    public List<Place> getAllPlace() {
        List<Place> places = new ArrayList<>();
        places.add(new Place("Hội An", "https://example.com/hoian.jpg", 4.8));
        places.add(new Place("Sài Gòn", "https://example.com/saigon.jpg", 4.5));
        places.add(new Place("Đà Nẵng", "https://example.com/danang.jpg", 4.7));
        places.add(new Place("Hà Nội", "https://example.com/hanoi.jpg", 4.6));
        return places;
    }

}
