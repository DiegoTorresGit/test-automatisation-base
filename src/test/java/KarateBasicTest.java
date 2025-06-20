import com.intuit.karate.junit5.Karate;

//prueba
class KarateBasicTest {
    static {
        System.setProperty("karate.ssl", "true");
    }
    @Karate.Test
    Karate testBasic() {
        return Karate.run("classpath:karate-test.feature",
                        "classpath:crearPersonajeMarvel.feature");
    }

}
