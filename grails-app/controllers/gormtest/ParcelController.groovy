package gormtest



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ParcelController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Parcel.list(params), model:[parcelInstanceCount: Parcel.count()]
    }

    def show(Parcel parcelInstance) {
        respond parcelInstance
    }

    def create() {
        respond new Parcel(params)
    }

    @Transactional
    def save(Parcel parcelInstance) {
        if (parcelInstance == null) {
            notFound()
            return
        }

        if (parcelInstance.hasErrors()) {
            respond parcelInstance.errors, view:'create'
            return
        }

        parcelInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'parcel.label', default: 'Parcel'), parcelInstance.id])
                redirect parcelInstance
            }
            '*' { respond parcelInstance, [status: CREATED] }
        }
    }

    def edit(Parcel parcelInstance) {
        respond parcelInstance
    }

    @Transactional
    def update(Parcel parcelInstance) {
        if (parcelInstance == null) {
            notFound()
            return
        }

        if (parcelInstance.hasErrors()) {
            respond parcelInstance.errors, view:'edit'
            return
        }

        parcelInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Parcel.label', default: 'Parcel'), parcelInstance.id])
                redirect parcelInstance
            }
            '*'{ respond parcelInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Parcel parcelInstance) {

        if (parcelInstance == null) {
            notFound()
            return
        }

        parcelInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Parcel.label', default: 'Parcel'), parcelInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'parcel.label', default: 'Parcel'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
