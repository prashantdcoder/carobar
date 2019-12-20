package com.carobar

import carvo.CarVo

import commandObject.CarBasicsCommand
import commandObject.CarCapacityCommand
import commandObject.CarComfortCommand
import commandObject.CarCommand
import commandObject.CarEngineCommand
import commandObject.CarSafetyCommand
import commandObject.CarSearchCO
import commandObject.FeedbackCommand
import commandObject.MessageCommand
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

import javax.imageio.ImageIO
import java.awt.image.BufferedImage
import java.io.*
import java.lang.*
import java.io.File;
import grails.plugin.springsecurity.SpringSecurityUtils

class HomeController {
    def id=0
    def carService;
    def springSecurityService

    @Secured("IS_AUTHENTICATED_FULLY")
    def index() {
        User user=springSecurityService.getCurrentUser()
        def sellercar=Car.findAllByUser(user)
        if(SpringSecurityUtils.ifAllGranted("Admin_Role1")) {
            def c = Car.createCriteria()
            def carList = c.list(max: params.max ?: 5, offset: params.offset ?: 0) {}
            [carList: carList, carsCount: carList.totalCount, params: params]
        }
        else if(SpringSecurityUtils.ifAllGranted("Seller_Role")){
            render(view: 'car',model: [sellercar: sellercar])
        }
        else {
            redirect(controller: 'home',action: 'search')
        }
    }

   @Secured('hasRole["ROLE_ADMIN"]')
    def user_index(){
        render("User index action")
    }

    @Secured('hasRole("Admin_Role1")')
    def insert(CarCommand carCommand){

        def carcompany=carCommand.carCompany.getValue().toString()
        User user=springSecurityService.getCurrentUser()
        def file = request.getFile('carImage')
        def multiFiles= request.getMultiFileMap().carImage.each {
                           }


        carCommand.validate()
         if(carCommand.hasErrors()) {

                  carCommand.errors.allErrors.each {log.debug("Erros while inserting" +it)

                }
            }

       carService.photoUpload(file, carCommand.carNumber, carCommand.carPrice, carCommand.carTitle, carCommand.carType,multiFiles,carcompany,user)
        flash.message="Car has been added successfully"

         redirect(controller: 'home',action: 'index')
          return
    }



    def renderImage(params){


        String profileImagePath = "${grailsApplication.config.imagePath}/${params.carNumber}"
        Car car=Car.findByCarNumber(params.carNumber)
        String image=car.carImage
        String ext=carService.showImage(image)
        File imageFile =new File(profileImagePath+"/"+image)
        BufferedImage originalImage=ImageIO.read(imageFile)
        ByteArrayOutputStream baos=new ByteArrayOutputStream();
        ImageIO.write(originalImage, ext , baos );
        byte[] imageInByte=baos.toByteArray();
        response.setHeader('Content-length', imageInByte.length.toString())
        response.contentType = 'image/jpg'
        response.outputStream << imageInByte
        response.outputStream.flush()

    }

    def deleteCar(){
        Long carId=params.carId as Long
        Car car=Car.findById(carId)
        def viewCount=ViewCount.findAllByCar(car)
        viewCount.each {
            it.delete(flush: true)
        }
        car.delete(flush: true)
        redirect(controller: 'home', action: 'index')

    }
    def editCar(){

        Car  edit=Car.findById(params.id)
        render view: 'editCar',model: [car:edit]
    }

    def editCarDetails(CarCommand carCommand){


        carCommand.validate()
        if (carCommand.hasErrors()){
            carCommand.errors.allErrors.each {log.debug("Erros while editing" +it)}
         }

         def multipleCarImages=request.getMultiFileMap().carImage.each(){

        }

        carService.edit(carCommand,multipleCarImages)
        flash.message="Car has been updated successfully"
        redirect(controller: 'home',action: 'index')


    }


    def search(){

        def car=Car.createCriteria().list{}
        car.each {
            /*println("==========")
            println(it.carTitle)*/
        }
       render(view: 'car',model: [carList: car])

    }


def listingOfCars(CarSearchCO carSearchCO){

    List<Car> carList=null
    carList = carService.listingsOfCars(carSearchCO);
    render template: 'listingOfCars',model: [carList: carList]

    }

    def viewCar(CarCommand carCommand){

        Car car=Car.findByCarNumber(carCommand.carNumber)
        User user=springSecurityService.getCurrentUser()
        ViewCount viewCount=ViewCount.findByCarAndUser(car,user)

        if(viewCount){

        }else {


            viewCount=new ViewCount(user: user,car: car);
            viewCount.save(flush: true,failOnError: true);
        }

        CarBasics carBasics=CarBasics.findByCar(car)
        CarCapacity carCapacity=CarCapacity.findByCar(car)
        CarComfort carComfort=CarComfort.findByCar(car)
        CarEngineTransmission carEngineTransmission=CarEngineTransmission.findByCar(car)
        CarSafety carSafety=CarSafety.findByCar(car)


        Picture.findAllByCar(Car.findByCarNumber(car.carNumber));

        String profileImagePath = "${grailsApplication.config.imagePath}/${params.carNumber}"
        File imageFile =new File(profileImagePath+"/")
        def imageArray = [];

        imageFile.list().each{


             File fullpath =new File(profileImagePath+"/"+it)
             def ext=carService.showImage(it)
             BufferedImage originalImage=ImageIO.read(fullpath)
             ByteArrayOutputStream baos=new ByteArrayOutputStream();
             ImageIO.write(originalImage, ext , baos );
             byte[] imageInByte=baos.toByteArray();
             imageArray.add("data:image/"+ext+";base64,"+imageInByte.encodeBase64().toString())
        }


       render (view: 'viewCar',model: [car: car,imageArray:imageArray,carBasics:carBasics,carCapacity:carCapacity,
                                       carComfort:carComfort,carEngineTransmission:carEngineTransmission,carSafety:carSafety])

    }

    def slideshow(params){
        String profileImagePath = "${grailsApplication.config.imagePath}/${params.carNumber}"

        Car car=Car.findByCarNumber(params.carNumber)
        Picture pic=Picture.findAllByCar(car)
        File imageFile =new File(profileImagePath+"/")
        imageFile.list().each{


            File fullpath =new File(profileImagePath+"/"+it)
            def ext=carService.showImage(it)
            BufferedImage originalImage=ImageIO.read(fullpath)
            ByteArrayOutputStream baos=new ByteArrayOutputStream();
            ImageIO.write(originalImage, ext , baos );
            byte[] imageInByte=baos.toByteArray();
            response.setHeader('Content-length', imageInByte.length.toString())
            response.contentType = 'image/jpg'
            response.outputStream << imageInByte
            response.outputStream.flush()
        }

    }

    def addCars() {

           [car: new CarVo()]
    }


    def additionalDetails(CarCommand carCommand,CarVo carVo){
        if(params.carId){

            def carid=params.carId

            def multiFiles = request.getMultiFileMap().carImage.each {
            }
            carService.editCarDetails(carVo,multiFiles,carid)

        }
        else {

            try {


            def carcompany = carCommand.carCompany.getValue().toString()
            User user = springSecurityService.getCurrentUser()
            def file = request.getFile('carImage')

            def multiFiles = request.getMultiFileMap().carImage.each {
            }

           id = carService.photoUpload(file, carCommand.carNumber, carCommand.carPrice, carCommand.carTitle, carCommand.carType, multiFiles, carcompany, user)
            }catch (Exception){
                flash.message="Please fill basic details"
            }

        }

        Car car=Car.findById(id)
        CarVo carVo1=new CarVo()
        bindData(carVo1,car)

        render(view: 'addCars',model: [car: carVo1])


    }

    def addGeneralSpecifications(CarBasicsCommand carBasicsCommand,CarVo carVo,params){

        def carid=params.carId
        Car car=Car.findById(params.carId)
        CarBasics carBasics=CarBasics.findByCar(car)

        if (carBasics) {
            carService.editGeneralSpecs(carVo,carid,params.year)
        }
        else {
            carService.insertGenSpecs(carBasicsCommand,carid,params.year)
        }

        render "success"
        return
    }

    def addEngineDetails(CarEngineCommand carEngineCommand,CarVo carVo){

        def carid=params.carId
        Car car=Car.findById(carid)
        CarEngineTransmission carEngineTransmission=CarEngineTransmission.findByCar(car)

        if(carEngineTransmission){

            carService.editEngineDetails(carVo,carid)
        }
        else{
            carService.insertEngineSpecs(carEngineCommand,carid)
        }
        render "success"
        return

    }

    def addCapacityDetails(CarCapacityCommand carCapacityCommand,CarVo carVo){

        def carid=params.carId
        Car car=Car.findById(carid)
        CarCapacity capacity=CarCapacity.findByCar(car)


        if(capacity){

            carService.editCapacityDetails(carVo,carid)
        }
        else{

            carService.insertCapacity(carCapacityCommand,params.carId)
        }


        CarVo carVo1=new CarVo()
        bindData(carVo1,car)

        render(view: 'addCars',model: [car: carVo1])
        return
    }

    def addComfortDetails(CarComfortCommand carComfortCommand,CarVo carVo){

        def carid=params.carId
        Car car=Car.findById(carid)
        CarComfort carComfort=CarComfort.findByCar(car)


        if(carComfort){
            carService.editComfortDetails(carVo,carid)
        }
        else{

            carService.insertComfort(carComfortCommand,params.carId)
        }

        CarVo carVo1=new CarVo()
        bindData(carVo1,car)

        render(view: 'addCars',model: [car: carVo1])
        return
    }

    def addSafetyDetails(CarSafetyCommand carSafetyCommand,CarVo carVo){

        def carid=params.carId
        Car car=Car.findById(carid)
        CarSafety carSafety=CarSafety.findByCar(car)

        if(carSafety){
            carService.editSafetyDetails(carVo,carid)

        }
        else {

          carService.insertSafety(carSafetyCommand,params.carId)
        }

        CarVo carVo1=new CarVo()
        bindData(carVo1,car)

        render(view: 'addCars',model: [car: carVo1])

        return
    }

    def editOtherDetails(CarVo carVo){

        Car car=Car.findById(params.id)
        CarBasics carBasics=CarBasics.findByCar(car)
        CarEngineTransmission carEngine=CarEngineTransmission.findByCar(car)
        CarCapacity carCapacity=CarCapacity.findByCar(car)

        bindData(carVo,carBasics)
        bindData(carVo,carEngine)
        bindData(carVo,carCapacity)
        bindData(carVo,car)

        render(view: 'addCars',model: [car:carVo])
    }

    def deleteOtherDetails(params){

        println("===============")
        println("id"+params.id)
        Car del=Car.findById(params.id)
        def viewCount=ViewCount.findAllByCar(del)
        viewCount.each {
           // it.delete(flush: true)
        }
       // del.delete(flush: true)
        redirect(controller: 'home', action: 'index')
    }

    def addToWishlist(){

        User user=springSecurityService.getCurrentUser()
        Car car=Car.findById(params.carId)
        String result=carService.addToWishlist(user,car)

        render result;
    }
    def countWishlist(){

        User user=springSecurityService.getCurrentUser()
        Integer count=carService.countWishlist(user)
        render count
    }

    def wishlist(){

        User user=springSecurityService.getCurrentUser()
        List<Car> car=carService.wishlist(user)
        render view: 'wishlist' , model:[view:car]

    }
    def deleteWishlist(params){
        Car deletecar=Car.findById(params.carId)

        User user=springSecurityService.getCurrentUser()
        Wishlist deletewishlist=Wishlist.findByCarAndUser(deletecar,user)
        if(deletewishlist){
            deletewishlist.delete(flush: true)
        }else {

        }

        List<Car> car=carService.wishlist(user)
        render view: 'wishlist',model:[view:car]
    }

    def compareCar(){
        String carId="";
        carId=params.id
         List<Car> carList=carService.compareCar(carId)

        render(view: 'compare',model: [carList: carList])

    }
    def compare(){


    }
    def redirectionPage() {
        User user=springSecurityService.getCurrentUser()

        if (user.authorities.any { it.authority == "Buyer_ROLE" }) {
            redirect controller: 'home',action: 'search'
        }
        else if(user.authorities.any { it.authority == "Seller_Role" }){
            redirect controller: 'home',action: 'index'
        }
        else {
            redirect controller: 'home',action: 'index'
        }

    }

    def viewCount() {

        String carid=params.carId
        Integer count = carService.viewCount(carid)
        def responseData = [:];
        responseData["carId"] = params.carId
        responseData["count"] = count
        render responseData as JSON
    }
    def message(MessageCommand messageCommand){

        ThreadMessage threadMessage=null;
        User user=springSecurityService.getCurrentUser()
        if(SpringSecurityUtils.ifAllGranted("Buyer_ROLE")){

            String receiver=messageCommand.sender;
            String sender=user.getUsername()
            String message=messageCommand.message

            User senderId=User.findByUsername(sender)
            User receiverId=User.findByUsername(receiver)
            List<Message> message1=null;
            messageCommand.validate()

            if(messageCommand.hasErrors()){
                render(view:'message',model: [messageCommand:messageCommand])
                return

            }else {
                Date date = new Date()
                threadMessage= new ThreadMessage()
                threadMessage.save(flush: true, failOnError: true)
                Car car=Car.findByCarNumber(params.carnumber)
                Message contact = new Message(sender: senderId, receiver: receiverId, message: message, threadMessage: threadMessage, date: date,carImage: car.carNumber,seen: false,senderDelete: false,receiverDelete: false)
                contact.save(flush: true, failOnError: true)
                redirect(controller: 'home',action: 'userIdentification',params: [car:car])

            }

        }else{
            List<Message> messageList=Message.findAllByReplyIsNullAndReceiver(user)

            render(view: 'message',model: [message1:messageList])
        }

    }

    def userIdentification(){

        User user=springSecurityService.getCurrentUser()
        if(SpringSecurityUtils.ifAllGranted("Buyer_ROLE")){

            List<Message> messageList = Message.findAllBySenderAndReplyAndSenderDelete(user,null,false)
            render(view: 'message',model: [message1: messageList])
        }
        else {
            List<Message> messageList=Message.findAllByReplyIsNullAndReceiverAndReceiverDelete(user,false)
            render(view: 'message',model: [message1:messageList])
        }
    }

    def buyerReplyMessage(){

        User user=springSecurityService.getCurrentUser()
        String tm=params.thread
        String text=params.message
        carService.buyerReplyMessage(user,tm,text)
        redirect(controller: 'home', action: 'conversations', params: [threadMessage: tm])
    }

    def conversations(){

        User user=springSecurityService.getCurrentUser()
        Long threadMessage= Long.parseLong(params.threadMessage)
        List<Message>messageList= carService.conversations(threadMessage,user)
        render(view: 'conversations',model: [messageList:messageList,user:user,threadMessage:threadMessage])
    }

    def countUnseenMessages(){

        User user=springSecurityService.getCurrentUser()
        Long data= Long.parseLong(params.threadId)
        Integer count=carService.countUnseenMessages(user,data)
        render count
    }

    def deleteMessage(){

        Long id= Long.parseLong(params.threadId)
        carService.deleteMessage(id)
        redirect(controller: 'home',action: 'userIdentification')
    }

    def feedback(FeedbackCommand feedbackCommand){
        User user=springSecurityService.getCurrentUser()
        if(SpringSecurityUtils.ifAllGranted("Admin_Role1")){
            List<Feedback> feedbackList=Feedback.createCriteria().list(max: params.max ?: 5, offset: params.offset ?: 0) {
                order("date", "desc")
            }
            render(view: 'feedback',model: [feedbackList:feedbackList,feedbackCount:feedbackList.totalCount, params: params])
        }
        else {
            feedbackCommand.validate();
            if(feedbackCommand.hasErrors()){

                render(view: 'feedback',model: [feedbackCommand:feedbackCommand])
                return
            }
            Feedback feedback=new Feedback(user: user,heading:feedbackCommand.heading,content: feedbackCommand.content ,date: new Date() )
            feedback.save(flush: true,failOnError: true)
            flash.message="Thank you for the feedback"
            render(view: 'feedback')
            return
        }
    }

    def carDetails(){

        def carList1=Car.createCriteria().list {}
        String htmlContent = g.render([template: 'images/carDetails',model: [carList: carList1]])
        Map responseData = [htmlContent: htmlContent]
        render(responseData as JSON)

    }

    def addCarsByAdmin(){

        String htmlContent = g.render([template: 'images/addCarsByAdmin'])
        Map responseData = [htmlContent: htmlContent]
        render(responseData as JSON)
    }

}

