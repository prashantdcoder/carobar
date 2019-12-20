package com.carobar

import com.stripe.Stripe
import com.stripe.exception.*;
import com.stripe.model.Charge
import com.stripe.exception.CardException;

class CheckoutController {
    def springSecurityService

    def index() {

        if(params.carIdentificationNumber.class.isArray()){
            List<String> stringList=params.carIdentificationNumber
            render(view: 'index',model:  [carIdAsList:stringList])
        }
        else{
            String string=params.carIdentificationNumber
            Long caridInLong=Long.parseLong(string)
            render(view: 'index',model: [carIdAsString: caridInLong])
        }
    }

    def charge(String stripeToken, Double amount) {
        Stripe.apiKey=grailsApplication.config.grails.plugins.stripe.secretKey

        def amountInCents = (amount * 100) as Integer
        def chargeParams = [
                'amount': amountInCents,
                'currency': 'inr',
                'card': stripeToken,
                'description': 'CaroBar'
        ]

        def status
        try {
            Charge.create(chargeParams);
            User user=springSecurityService.getCurrentUser()

            if(params.carIdentificationNumberAsList){
                params.carIdentificationNumberAsList.each{
                    Car car=Car.findById(it as Long)
                    car.soldOut=true
                    car.buyer=user
                    car.save(flush: true,failOnError: true)
                 }
            }
            else {
                params.carIdentificationNumberAsString
                Car car=Car.findById( params.carIdentificationNumberAsString as Long)
                car.soldOut=true
                car.buyer=user
                car.save(flush: true,failOnError: true)
            }
            List<Wishlist> wishlist=Wishlist.findAllByUser(user)
            wishlist.each {
                it.delete(flush: true);
            }
            status = 'Your purchase was successful.'

        } catch(CardException ex) {

            status = 'There was an error processing your credit card.'
        }catch(InvalidRequestException e){
            println(e)
            status='InvalidRequestException'
        }catch (AuthenticationException e) {
           status='AuthenticationException'
        } catch (APIConnectionException e) {
            status='APIConnectionException'
        } catch (StripeException e) {
           status='StripeException'
        }

        redirect(action: "confirmation", params: [msg: status])
        return
    }
    def confirmation(String msg) {
        [msg: msg]
    }
}
