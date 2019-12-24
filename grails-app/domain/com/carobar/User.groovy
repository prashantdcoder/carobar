package com.carobar

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes = 'username')
@ToString(includes = 'username', includeNames = true, includePackage = false)
class User implements Serializable {

    private static final long serialVersionUID = 1

    transient springSecurityService

    String username
    String password
    Integer number
    String email
    String city

    String uuid
    boolean enabled = false
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    User() {

    }

    User(String username, String password) {
        this()
        this.username = username
        this.password = password
    }

    Set<Role> getAuthorities() {
        UserRole.findAllByUser(this)*.role
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
    }

    static findByEmailOrUsername(String email, String username) {
        User user = createCriteria().get {
            or {
                eq('username', username)
                eq('email', email)
            }
        } as User
        return user ?: null
    }

    static transients = ['springSecurityService']

    static constraints = {
        username blank: false, unique: true
        number nullable: true
        city nullable: true
        email nullable: false, email: true
        uuid nullable: true
    }

    static hasMany = [car: Car, feedback: Feedback]
}
