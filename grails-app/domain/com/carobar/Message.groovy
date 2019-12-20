package com.carobar

class Message {

    User sender
    User receiver
    String message
    Long reply
    Date date
    ThreadMessage threadMessage
    String carImage
    Boolean seen
    Boolean receiverDelete
    Boolean senderDelete
    static constraints = {
        message nullable: true
        reply nullable: true
        receiverDelete nullable: true
        senderDelete nullable: true
    }
 static belongsTo = [threadMessage:ThreadMessage]
}
