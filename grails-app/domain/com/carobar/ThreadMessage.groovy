package com.carobar

class ThreadMessage {

    static constraints = {
        id nullable: true
    }

    static hasMany = [message: Message]
}
