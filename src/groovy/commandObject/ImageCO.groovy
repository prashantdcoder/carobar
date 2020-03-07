package commandObject

import grails.validation.Validateable
import org.springframework.web.multipart.MultipartFile

@Validateable
class ImageCO {

    MultipartFile image1
    MultipartFile image2
    MultipartFile image3
    MultipartFile image4
    Boolean isUploaded = false


    static constraints = {

        image1 nullable: false, validator: { val, obj ->
            if (getExtension(val.originalFilename) in ['jpeg', 'jpg', 'png']) {
                return true
            } else {
                return "image.extension.not.found.custom.validation"
            }

        }
        image2 nullable: false, validator: { val, obj ->
            if (getExtension(val.originalFilename) in ['jpeg', 'jpg', 'png']) {
                return true
            } else {
                return "image.extension.not.found.custom.validation"
            }
        }
        image3 nullable: true
        image4 nullable: true
    }

    static String getExtension(String fileName) {
        return fileName.substring(fileName.indexOf(".") + 1, fileName.length()).toLowerCase()
    }
}
