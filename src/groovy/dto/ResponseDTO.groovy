package dto

class ResponseDTO<T> {

    boolean status = true
    T data = null
    String message

    void setSuccessResponse(T data, String message = '') {
        this.data = data
        this.message = message
    }

    void setFailureResponse(String message = '') {
        this.data = null
        this.status = false
        this.message = message
    }
}
