package org.ober6.charm.back.service;

import org.ober6.charm.back.dao.ProfileDao;
import org.ober6.charm.back.dto.ProfileGetDto;
import org.ober6.charm.back.dto.ProfileUpdateDto;
import org.ober6.charm.back.dto.RegistrationDto;
import org.ober6.charm.back.mapper.ProfileToProfileGetDtoMapper;
import org.ober6.charm.back.mapper.ProfileUpdateDtoToProfileMapper;
import org.ober6.charm.back.mapper.RegistrationDtoToProfileMapper;

import java.util.List;
import java.util.Optional;

public class ProfileService {

    private static final ProfileService INSTANCE = new ProfileService();

    private final ProfileDao dao = ProfileDao.getInstance();

    private final ProfileToProfileGetDtoMapper profileToProfileGetDtoMapper = ProfileToProfileGetDtoMapper.getInstance();

    private final ProfileUpdateDtoToProfileMapper profileUpdateDtoToProfileMapper = ProfileUpdateDtoToProfileMapper.getInstance();

    private final RegistrationDtoToProfileMapper registrationDtoToProfileMapper = RegistrationDtoToProfileMapper.getInstance();

    private ProfileService() {
    }

    public static ProfileService getInstance() {
        return INSTANCE;
    }

    public Long save(RegistrationDto dto) {
        return dao.save(registrationDtoToProfileMapper.map(dto)).getId();
    }

    public Optional<ProfileGetDto> findById(Long id) {
        return dao.findById(id).map(profileToProfileGetDtoMapper::map);
    }

    public List<ProfileGetDto> findAll() {
        return dao.findAll().stream().map(profileToProfileGetDtoMapper::map).toList();
    }

    public void update(ProfileUpdateDto dto) {
        dao.findById(dto.getId())
                .ifPresent(profile -> dao.update(profileUpdateDtoToProfileMapper.map(dto, profile)));
    }

    public boolean delete(Long id) {
        return dao.delete(id);
    }
}