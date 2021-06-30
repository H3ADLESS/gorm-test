import gormtest.Category
import gormtest.Container
import gormtest.Parcel

class BootStrap {

    def init = { servletContext ->

        Category catA = new Category(name: "A").save(failOnError: true)
        Category catB = new Category(name: "B").save(failOnError: true)

        Parcel p1 = new Parcel(name: "Parcel 1", category: catA).save(failOnError: true)
        Parcel p2 = new Parcel(name: "Parcel 2", category: catB).save(failOnError: true)
        Parcel p3 = new Parcel(name: "Parcel 3", category: catA).save(failOnError: true)
        Parcel p4 = new Parcel(name: "Parcel 4", category: catB).save(failOnError: true)
        Parcel p5 = new Parcel(name: "Parcel 5", category: catA).save(failOnError: true)
        Parcel p6 = new Parcel(name: "Parcel 6", category: catB).save(failOnError: true)

        new Container(name: "containerA", slot1: p1).save(failOnError: true)
        new Container(name: "containerB", slot1: p2, slot2: p3, slot3: p4).save(failOnError: true)
        new Container(name: "containerC", slot1: p5, slot2: p6).save(failOnError: true)
    }

    def destroy = {
    }
}
