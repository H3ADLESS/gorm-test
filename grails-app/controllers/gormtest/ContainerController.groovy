package gormtest

import grails.gorm.DetachedCriteria
import org.grails.datastore.mapping.query.api.BuildableCriteria
import org.hibernate.criterion.CriteriaSpecification

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ContainerController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
//        respond Container.list(params), model:[containerInstanceCount: Container.count()]

        def (result, count) = filter()
        respond result, model: [ordersInstanceCount: count]
    }

    private filter() {
        def containerCriteria = new DetachedCriteria<>(Container)

        if (params.categoryFilter && params.categoryFilter != "0") {
            def cat = Category.get(params.categoryFilter)
            containerCriteria = containerCriteria.build {
                or {
                    slot1 {
                        eq('category', cat)
                    }
                    slot2 {
                        eq('category', cat)
                    }
                    slot3 {
                        eq('category', cat)
                    }
                }
            }
        }

        return [containerCriteria.list(params), containerCriteria.count()]
    }

    def show(Container containerInstance) {
        respond containerInstance
    }

    def create() {
        respond new Container(params)
    }

    @Transactional
    def save(Container containerInstance) {
        if (containerInstance == null) {
            notFound()
            return
        }

        if (containerInstance.hasErrors()) {
            respond containerInstance.errors, view:'create'
            return
        }

        containerInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'container.label', default: 'Container'), containerInstance.id])
                redirect containerInstance
            }
            '*' { respond containerInstance, [status: CREATED] }
        }
    }

    def edit(Container containerInstance) {
        respond containerInstance
    }

    @Transactional
    def update(Container containerInstance) {
        if (containerInstance == null) {
            notFound()
            return
        }

        if (containerInstance.hasErrors()) {
            respond containerInstance.errors, view:'edit'
            return
        }

        containerInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Container.label', default: 'Container'), containerInstance.id])
                redirect containerInstance
            }
            '*'{ respond containerInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Container containerInstance) {

        if (containerInstance == null) {
            notFound()
            return
        }

        containerInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Container.label', default: 'Container'), containerInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'container.label', default: 'Container'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
