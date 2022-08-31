package bookstoresecurity2

import com.mycompany.myapp.Role
import com.mycompany.myapp.User
import com.mycompany.myapp.UserRole
import grails.gorm.transactions.Transactional

class BootStrap {
    def init = {
        addTestUser()
    }

    @Transactional
    void addTestUser() {
        def adminRole = new Role(authority: 'ROLE_ADMIN').save()


        def testUser = new User(username: 'me', password: 'password').save()

        def testUser2 = new User(username: 'me2', password: 'password').save()

        UserRole.create testUser, adminRole

//        UserRole.create testUser, adminSwitchRole

        UserRole.create testUser2, adminRole



        UserRole.withSession {
            it.flush()
            it.clear()
        }

        assert User.count() == 2
        assert Role.count() == 1
        assert UserRole.count() == 2
    }
}