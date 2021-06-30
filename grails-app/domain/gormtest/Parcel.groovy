package gormtest

class Parcel {

    String name
    Category category

    static constraints = {
        category nullable: false;
    }

    String toString() {
        return name
    }

}
