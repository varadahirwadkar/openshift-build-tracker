import groovy.json.*
def call(String tokens) {
    def json = new JsonSlurper().parseText(tokens)
    def data = json.id_token
    return data
 }
