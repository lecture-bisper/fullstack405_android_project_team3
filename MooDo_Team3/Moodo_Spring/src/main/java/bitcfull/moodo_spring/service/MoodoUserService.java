package bitcfull.moodo_spring.service;

import bitcfull.moodo_spring.model.MooDoUser;
import bitcfull.moodo_spring.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class MoodoUserService {

    @Autowired
    private UserRepository userRepository;

//    회원가입
    public MooDoUser insert(MooDoUser user) {
        return userRepository.save(user);
    }

//    로그인
    public Optional<MooDoUser> findById(String id) {
        return userRepository.findById(id);
    }

    // 회원가입 시 아이디 중복 여부 확인
    public int userIdCheck(String id) {
        int result = userRepository.countById(id);

        return result;
    }

    // 사용자 목록 조회
    public List<MooDoUser> getAllUsers() {
        return userRepository.findAll();
    }

    // 사용자 정보 가져오기
    public MooDoUser getUserInfo(String id) {
        return userRepository.findById(id).orElseThrow(() ->
                new IllegalArgumentException("사용자를 찾을 수 없습니다.")
        );
    }
}
