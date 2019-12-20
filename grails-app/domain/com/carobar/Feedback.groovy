package com.carobar

class Feedback {

    User user
    String heading
    String content
    Date date
    static constraints = {
    }

    static  belongsTo = [user:User]
}
