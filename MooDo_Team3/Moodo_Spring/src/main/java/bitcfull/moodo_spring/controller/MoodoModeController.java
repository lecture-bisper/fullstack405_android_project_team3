package bitcfull.moodo_spring.controller;

import bitcfull.moodo_spring.model.MoodoMode;
import bitcfull.moodo_spring.service.MoodoModeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.*;

@RestController
@RequestMapping("/api/mood")
public class MoodoModeController {

    @Autowired
    private MoodoModeService moodoModeService;

    // 유저 전체 기분 목록과 가장 많은 기분값 조회
    @GetMapping("/list/{userId}")
    public Map<String, Object> userMoodList(@PathVariable String userId) {
        List<MoodoMode> moodList = moodoModeService.findByUserId(userId);
        Integer moodMax = moodoModeService.findMoodMax(userId);

        Map<String, Object> result = new HashMap<>();
        result.put("moodList", moodList);
        result.put("moodMax", moodMax);

        return result;
    }

    // 특정 날짜 기분값 조회
    @GetMapping("/list/{userId}/{date}")
    public Optional<MoodoMode> userMoodList(@PathVariable String userId, @PathVariable Date date) {
        return moodoModeService.findByUserAndDate(userId, date);
    }

    // 기분 기록 추가
    @PostMapping("/insert")
    public MoodoMode insertMood(@RequestBody MoodoMode mood) {

        // 사용자 정보가 있는지 확인
        if (mood.getUser() == null || mood.getUser().getId() == null) {
            throw new IllegalArgumentException("사용자 정보가 없습니다.");
        }

        // 조회날짜 Date로 변경
        LocalDate now = LocalDate.now();
        Date nowDate = moodoModeService.localDateToDate(now);

        // 당일 혹 과거 날짜만 기록 가능 설정
        if (mood.getCreatedDate().after(nowDate)) {
            throw new IllegalArgumentException("다가올 날짜에는 기록할 수 없습니다.");
        }

        // 특정 날짜에 한 유저 당 1회만 기록 가능 설정
        Optional<MoodoMode> existMood = moodoModeService.findByUserAndDate(mood.getUser().getId(), mood.getCreatedDate());
        if (existMood.isPresent()) {
            throw new IllegalArgumentException("중복 기록은 불가합니다.");
        }
        return moodoModeService.insert(mood);
    }

    // 기분 기록 수정 ++ 날씨, 일기 추가
    @PutMapping("/update/{id}")
    public MoodoMode update(@PathVariable Long id, @RequestParam int mdMode, @RequestParam int weather, @RequestParam String mdDaily) {
        Optional<MoodoMode> existMood = moodoModeService.findById(id);
        if (existMood.isPresent()) {
            MoodoMode updatedMood = existMood.get();
            updatedMood.setMdMode(mdMode);
            updatedMood.setWeather(weather);
            updatedMood.setMdDaily(mdDaily);
            return moodoModeService.update(updatedMood);
        } else {
            throw new RuntimeException("기록을 찾을 수 없습니다.");
        }
    }

    // 기분 기록 삭제
    @DeleteMapping("/delete/{id}")
    public void delete(@PathVariable Long id) {
        moodoModeService.delete(id);
    }



}