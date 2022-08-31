package com.mycompany.myapp

import grails.plugin.springsecurity.annotation.Secured



class SecureController {

    @Secured('ROLE_ADMIN')
    def index() {

        [id:1]
    }
}
