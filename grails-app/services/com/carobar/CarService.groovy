package com.carobar

import carvo.CarVo
import commandObject.*
import dto.ResponseDTO
import enums.FuelType
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.transaction.Transactional
import org.codehaus.groovy.grails.commons.GrailsApplication

//import spock.util.mop.Use

@Transactional
class CarService {
    GrailsApplication grailsApplication
//    AsynchronousMailService asynchronousMailService

    def groovyPageRenderer

    def springSecurityService

    def grailsLinkGenerator

    def photoUpload(def file, String number, Integer price, String title, String type, def multiFiles, String carCompany, User user) {
        Car car = new Car()
        def imageName = file.originalFilename
        car.carTitle = title
        car.carImage = imageName
        car.carType = type
        car.carPrice = price
        car.carNumber = number
        car.carCompany = carCompany
        car.user = user
        car.soldOut = false
        car.buyer = null

        String picturePath = "${grailsApplication.config.imagePath}"
        Boolean folder = new File("/home/prashantk/Documents/carobarimages/${car.carNumber}").exists()
        if (folder == true) {
            file.transferTo(new File("${grailsApplication.config.imagePath}/${car.carNumber}/${imageName}"))
        } else {
            def newFolder = new File("${grailsApplication.config.imagePath}/${car.carNumber}").mkdirs()
        }
        car.save(flush: true, failOnError: true)
        def id = car.getId()
        Car carId = Car.findByCarNumber(number)
        multiFiles.each {
            Picture picture = new Picture(car: carId.id, pictureName: it.originalFilename)
            picture.save(flush: true, failOnError: true)
            it.transferTo(new File("${grailsApplication.config.imagePath}/${car.carNumber}/${it.originalFilename}"))
        }
        return id
    }

    def showImage(String image) {
        String profileImagePath = "${grailsApplication.config.imagePath}"
        File imageFile = new File(profileImagePath + image)
        String ext = getFileExtension(imageFile)

        return ext
    }

    private static String getFileExtension(File file) {
        String fileName = file.getName();
        if (fileName.lastIndexOf(".") != -1 && fileName.lastIndexOf(".") != 0)
            return fileName.substring(fileName.lastIndexOf(".") + 1);
        else
            return "";
    }

    void edit(CarCommand carCommand, def multipleFileImages) {

        Car car = Car.findById(carCommand.id)


        car.id = carCommand.id
        car.carTitle = carCommand.carTitle
        car.carNumber = carCommand.carNumber
        car.carPrice = carCommand.carPrice
        car.carType = carCommand.carType
        car.carCompany = carCommand.carCompany

        def folder = new File("/home/prashantk/Documents/carobarimages/${car.carNumber}").exists()
        if (folder == true) {
            multipleFileImages.each {

                Picture picture = new Picture(car: car.id, pictureName: it.originalFilename)
                picture.save(flush: true, failOnError: true)
                it.transferTo(new File("${grailsApplication.config.imagePath}/${car.carNumber}/${it.originalFilename}"))

            }
        }


    }

    void insertGenSpecs(CarBasicsCommand carBasicsCommand, def id, def year) {

        CarBasics carBasics = new CarBasics(car: id,
                city: carBasicsCommand.city,
                distance: carBasicsCommand.distance,
                fuel: carBasicsCommand.fuel,
                year: year)
        carBasics.save(flush: true, failOnError: true)
    }

    void insertEngineSpecs(CarEngineCommand carEngineCommand, def id) {

        CarEngineTransmission carEngineTransmission = new CarEngineTransmission(acceleration: carEngineCommand.acceleration,
                topSpeed: carEngineCommand.topSpeed,
                engineDescription: carEngineCommand.engineDescription,
                cylinders: carEngineCommand.cylinders,
                maxPower: carEngineCommand.maxPower,
                maxTorque: carEngineCommand.maxTorque,
                car: id)
        carEngineTransmission.save(flush: true, failOnError: true)
    }

    void insertCapacity(CarCapacityCommand carCapacityCommand, def id) {

        CarCapacity carCapacity = new CarCapacity(fuelCapacity: carCapacityCommand.fuelCapacity,
                height: carCapacityCommand.height,
                length: carCapacityCommand.length,
                seatCapacity: carCapacityCommand.seatCapacity,
                tyreType: carCapacityCommand.tyreType,
                weight: carCapacityCommand.weight,
                wheelSize: carCapacityCommand.wheelSize,
                width: carCapacityCommand.width,
                car: id)
        carCapacity.save(flush: true, failOnError: true)

    }

    void insertComfort(CarComfortCommand carComfortCommand, def id) {

        CarComfort carComfort = new CarComfort(ac: carComfortCommand.ac,
                poweSteering: carComfortCommand.poweSteering,
                powerButton: carComfortCommand.powerButton,
                transmissionType: carComfortCommand.transmissionType,
                navigationSystem: carComfortCommand.navigationSystem,
                audioSystem: carComfortCommand.audioSystem,
                bluetooth: carComfortCommand.bluetooth,
                car: id)
        carComfort.save(flush: true, failOnError: true)


    }

    void insertSafety(CarSafetyCommand carSafetyCommand, def id) {

        CarSafety carSafety = new CarSafety(antiLockBreaking: carSafetyCommand.antiLockBreaking,
                parkingSensor: carSafetyCommand.parkingSensor,
                centralLocking: carSafetyCommand.centralLocking,
                airBags: carSafetyCommand.airBags,
                crashSensor: carSafetyCommand.crashSensor,
                antiTheftAlarm: carSafetyCommand.antiTheftAlarm,
                powerDoorLocks: carSafetyCommand.powerDoorLocks,
                rearCameras: carSafetyCommand.powerDoorLocks,
                car: id)
        carSafety.save(flush: true, failOnError: true)

    }

    void editCarDetails(CarVo carVo, def multiFiles, def id) {


        Car car = Car.findById(id)

        car.carTitle = carVo.carTitle
        car.carNumber = carVo.carNumber
        car.carPrice = carVo.carPrice
        car.carCompany = carVo.carCompany
        car.carType = carVo.carType
        car.buyer = null
        car.soldOut = false

        Boolean folder = new File("/home/prashantk/Documents/carobarimages/${car.carNumber}").exists()
        if (folder == true) {
            multiFiles.each {

                Picture picture = new Picture(car: car.id, pictureName: it.originalFilename)
                picture.save(flush: true, failOnError: true)
                it.transferTo(new File("${grailsApplication.config.imagePath}/${car.carNumber}/${it.originalFilename}"))

            }
        }
        car.save(flush: true, failOnError: true)
    }

    void editGeneralSpecs(CarVo carVo, def carid, def year) {
        Car car = Car.findById(carid)
        CarBasics carBasics = CarBasics.findByCar(car)
        carBasics.city = carVo.city
        carBasics.distance = carVo.distance
        carBasics.fuel = carVo.fuel
        int result = Integer.parseInt(year);
        carBasics.year = result

        carBasics.save(flush: true, failOnError: true)

    }

    void editEngineDetails(CarVo carVo, def carid) {
        Car car = Car.findById(carid)
        CarEngineTransmission carEngineTransmission = CarEngineTransmission.findByCar(car)
        carEngineTransmission.topSpeed = carVo.topSpeed
        carEngineTransmission.acceleration = carVo.acceleration
        carEngineTransmission.engineDescription = carVo.engineDescription
        carEngineTransmission.cylinders = carVo.cylinders
        carEngineTransmission.maxPower = carVo.maxPower
        carEngineTransmission.maxTorque = carVo.maxPower

        carEngineTransmission.save(flush: true, failOnError: true)
    }

    void editCapacityDetails(CarVo carVo, def carid) {
        Car car = Car.findById(carid)
        CarCapacity carCapacity = CarCapacity.findByCar(car)
        carCapacity.fuelCapacity = carVo.fuelCapacity
        carCapacity.height = carVo.height
        carCapacity.length = carVo.length
        carCapacity.seatCapacity = carVo.seatCapacity
        carCapacity.tyreType = carVo.tyreType
        carCapacity.weight = carVo.weight
        carCapacity.wheelSize = carVo.wheelSize
        carCapacity.width = carVo.width

        carCapacity.save(flush: true, failOnError: true)
    }

    void editComfortDetails(CarVo carVo, def carid) {
        Car car = Car.findById(carid)
        CarComfort carComfort = CarComfort.findByCar(car)
        carComfort.ac = carVo.ac
        carComfort.audioSystem = carVo.audioSystem
        carComfort.bluetooth = carVo.bluetooth
        carComfort.navigationSystem = carVo.navigationSystem
        carComfort.poweSteering = carVo.poweSteering
        carComfort.powerButton = carVo.powerButton
        carComfort.transmissionType = carVo.transmissionType

        carComfort.save(flush: true, failOnError: true)


    }

    void editSafetyDetails(CarVo carVo, def carid) {
        Car car = Car.findById(carid)
        CarSafety carSafety = CarSafety.findByCar(car)
        carSafety.antiLockBreaking = carVo.antiLockBreaking
        carSafety.parkingSensor = carVo.parkingSensor
        carSafety.centralLocking = carVo.centralLocking
        carSafety.airBags = carVo.airBags
        carSafety.crashSensor = carVo.crashSensor
        carSafety.antiTheftAlarm = carVo.antiTheftAlarm
        carSafety.powerDoorLocks = carVo.powerDoorLocks
        carSafety.rearCameras = carVo.rearCameras

        carSafety.save(flush: true, failOnError: true)
    }

    def addToWishlist(User user, Car car) {
        Wishlist wishlist = Wishlist.findByUserAndCar(user, car)

        if (wishlist) {
            return "exists"
        } else {

            Wishlist wishlist1 = new Wishlist(user: user, car: car)
            wishlist1.save(flush: true, failOnError: true)

            String content = groovyPageRenderer.render(view: "/home/interestedUser", model: [user: user, car: car])
            /*asynchronousMailService.sendMail {
                to 'rhlsngh994@gmail.com'   // def email=user.email
                subject 'carobarTest';

                html content
            }*/
            return "success"
        }
    }

    Integer countWishlist(User user) {
        Integer wishlist = Wishlist.countByUser(user);
        return wishlist
    }

    List<Car> wishlist(User user) {
        List<Wishlist> wishlist = Wishlist.findAllByUser(user)
        def car = [];
        int i = 0
        wishlist.each {

            def carId = it.car.getId()
            car[i] = Car.findById(carId)
            i++;
        }
        return car
    }


    List<Car> listingsOfCars(CarSearchCO carSearchCO) {


        List<Car> cars = null;
        List<String> list = null;
        List<String> list1 = null
        List<CarCompany> carCompanies = null
        List<FuelType> fuelType = null


        if (carSearchCO.fuel) {

            String[] fuelInArray = carSearchCO.fuel.split(",");
            list1 = Arrays.asList(fuelInArray);
            fuelType = list1.collect { FuelType.valueOf(it) }
            fuelType.each {
                println(it)
            }
        }
        if (carSearchCO.company) {

            String[] words = carSearchCO.company.split(",");
            list = Arrays.asList(words);
            carCompanies = list.collect { CarCompany.valueOf(it) }

        }

        Integer lowestPrice = carSearchCO.min * 100000
        Integer highestPrice = carSearchCO.max * 100000;


        cars = Car.createCriteria().list {
            createAlias('carBasics', 'cb')
            if (lowestPrice && highestPrice) {
                if (carSearchCO.company) {
                    if (carSearchCO.startYear != 0 || carSearchCO.endYear != 0) {

                        ge('carPrice', lowestPrice)
                        le('carPrice', highestPrice)
                        'in'('carCompany', carCompanies)
                        ge('cb.year', carSearchCO.startYear)
                        le('cb.year', carSearchCO.endYear)

                    } else {

                        ge('carPrice', lowestPrice)
                        le('carPrice', highestPrice)
                        'in'('carCompany', carCompanies)
                    }
                } else if (carSearchCO.startYear != 0 || carSearchCO.endYear != 0) {

                    ge('carPrice', lowestPrice)
                    le('carPrice', highestPrice)
                    ge('cb.year', carSearchCO.startYear)
                    le('cb.year', carSearchCO.endYear)
                } else {

                    ge('carPrice', lowestPrice)
                    le('carPrice', highestPrice)
                }
            } else if (carSearchCO.company) {

                if (carSearchCO.startYear != 0 || carSearchCO.endYear != 0) {
                    if (lowestPrice != 000000 || highestPrice != 000000) {

                        ge('carPrice', lowestPrice)
                        le('carPrice', highestPrice)
                        'in'('carCompany', carCompanies)
                        ge('cb.year', carSearchCO.startYear)
                        le('cb.year', carSearchCO.endYear)

                    } else {

                        'in'('carCompany', carCompanies)
                        ge('cb.year', carSearchCO.startYear)
                        le('cb.year', carSearchCO.endYear)
                    }
                } else {

                    'in'('carCompany', carCompanies)
                }
            } else if (carSearchCO.startYear != 0 || carSearchCO.endYear != 0) {

                if (carSearchCO.fuel) {
                    ge('cb.year', carSearchCO.startYear)
                    le('cb.year', carSearchCO.endYear)
                    'in'('cb.fuel', fuelType)
                }

            } else {

            }
        }

        return cars
    }

    List<Car> compareCar(String carId) {
        String[] carIdStringArray = carId.split(",")
        Long[] carIdLongArray = new Long[carIdStringArray.length]
        int i = 0;
        carIdStringArray.each {
            carIdLongArray[i] = Long.parseLong(it)
            i++;
        }
        List<Long> carList = Arrays.asList(carIdLongArray)
        List<Car> cars = Car.createCriteria().list {

            'in'('id', carList)
        }

        return cars

    }

    Integer viewCount(String carId) {

        Car car1 = Car.findById(carId.toLong())
        Integer count = ViewCount.countByCar(car1)
        return count

    }

    List<Message> conversations(Long threadMessage, User user) {
        ThreadMessage threadMessage1 = ThreadMessage.findById(threadMessage)
        List<Message> messageList = Message.findAllByThreadMessage(threadMessage1)
        List<Message> seenMessageList = Message.findAllByThreadMessageAndReceiver(threadMessage1, user)
        seenMessageList.each {
            it.seen = true;
            it.save(failOnError: true);
        }
        return messageList
    }

    Integer countUnseenMessages(User user, Long data) {
        List<Message> seenList = Message.findAllBySeenAndReceiverAndReply(false, user, data)
        Integer count = Message.countBySeenAndReceiverAndReply(false, user, data)
        return count
    }

    void deleteMessage(Long id) {
        ThreadMessage threadMessage = ThreadMessage.findById(id)
        Message message = Message.findByThreadMessage(threadMessage)

        if (SpringSecurityUtils.ifAllGranted("Buyer_ROLE")) {
            message.senderDelete = true;
            message.save(failOnError: true)
        } else {
            message.receiverDelete = true;
            message.save(failOnError: true)
        }
    }

    void buyerReplyMessage(User user, String tm, String text) {
        ThreadMessage threadMessage = ThreadMessage.findById(tm.toLong())
        Message message = Message.findByThreadMessage(threadMessage)
        String number = message.carImage.toString();
        if (SpringSecurityUtils.ifAllGranted("Buyer_ROLE")) {

            Message message1 = new Message(receiver: message.receiver, sender: user, message: text, threadMessage: threadMessage, date: new Date(), reply: threadMessage.id, carImage: number, seen: false)
            message1.save(failOnError: true)

        } else {

            Message message1 = new Message(receiver: message.sender, sender: user, message: text, threadMessage: threadMessage, date: new Date(), reply: threadMessage.id, carImage: number, seen: false)
            message1.save(failOnError: true)
        }
    }

    ResponseDTO addBasicDetails(CarCO carCO) {
        ResponseDTO responseDTO = new ResponseDTO()
        try {
            Car car = new Car(
                    title: carCO.title,
                    number: carCO.number,
                    type: carCO.carType,
                    price: carCO.price,
                    year: carCO.year,
                    city: carCO.city,
                    companyType: carCO.companyType,
                    fuelType: carCO.fuelType,
                    seller: springSecurityService.currentUser as User
            )
            car.save(failOnError: true)
            responseDTO.setSuccessResponse(null, "")
        } catch (Exception e) {
            responseDTO.setFailureResponse("")
        }
        return responseDTO
    }
}
