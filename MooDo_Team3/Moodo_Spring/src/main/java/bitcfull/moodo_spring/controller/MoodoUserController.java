package bitcfull.moodo_spring.controller;

import bitcfull.moodo_spring.model.MooDoUser;
import bitcfull.moodo_spring.service.MoodoUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/api/user")
public class MoodoUserController {

    @Autowired
    private MoodoUserService userService;

    // 회원가입
    @PostMapping("/signup")
    public MooDoUser signUp(@RequestBody MooDoUser user) {
        // 필수 정보 확인
        if (user.getId() == null || user.getName() == null || user.getPass() == null || user.getAge() == null) {
            throw new IllegalArgumentException("필수 정보가 누락되었습니다.");
        }

        // 아이디 중복 체크
        if (userService.userIdCheck(user.getId()) > 0) {
            throw new IllegalArgumentException("이미 사용 중인 아이디입니다.");
        }

        return userService.insert(user);
    }

    // 로그인 (ID와 비밀번호 확인)
    @PostMapping("/login")
    public MooDoUser login(@RequestBody MooDoUser user) {
        // ID로 사용자 조회
        Optional<MooDoUser> existingUser = userService.findById(user.getId());

        if (existingUser.isPresent()) {
            MooDoUser dbUser = existingUser.get();

            // 비밀번호 확인
            if (dbUser.getPass().equals(user.getPass())) {
                return dbUser;  // 로그인 성공, 사용자 정보 반환
            } else {
                throw new IllegalArgumentException("비밀번호가 일치하지 않습니다.");
            }
        } else {
            throw new IllegalArgumentException("사용자를 찾을 수 없습니다.");
        }
    }

    // ID 중복 확인
    @GetMapping("/check-id/{id}")
    public boolean checkId(@PathVariable String id) {
        return userService.userIdCheck(id) == 0;
    }

    // **사용자 목록 조회** 추가
    @GetMapping("/list")
    public List<MooDoUser> getAllUsers() {
        return userService.getAllUsers();
    }

    // 비밀번호 변경
    @PutMapping("/change-password/{id}")
    public MooDoUser changePassword(@PathVariable String id, @RequestBody Map<String, String> passwordMap) {
        String newPassword = passwordMap.get("newPassword");
        Optional<MooDoUser> existingUser = userService.findById(id);
        if (existingUser.isPresent()) {
            MooDoUser user = existingUser.get();
            user.setPass(newPassword);  // 새 비밀번호 설정
            return userService.insert(user);  // 변경 사항 저장
        } else {
            throw new IllegalArgumentException("사용자를 찾을 수 없습니다.");
        }
    }

    // 사용자 정보 가져오기
    @GetMapping("/userInfo/{id}")
    public MooDoUser getUserInfo(@PathVariable String id) {
        System.out.println("사용자 정보 가져오기 " + id);
        return userService.getUserInfo(id);
    }
}
