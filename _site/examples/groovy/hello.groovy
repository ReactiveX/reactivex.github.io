def hello(String[] names) {
    Observable.from(names)
        .subscribe({ println "Hello " + it + "!" })
}
