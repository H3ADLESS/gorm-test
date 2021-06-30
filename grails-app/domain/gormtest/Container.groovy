package gormtest

class Container {

    String name

    Parcel slot1
    Parcel slot2
    Parcel slot3

    static constraints = {
        slot1 nullable: true
        slot2 nullable: true
        slot3 nullable: true
    }

    String toName() {
        return name
    }

}
