@RestController
@RequestMapping("/api")
public class ApiController {

    @GetMapping("/data")
    public ResponseEntity<String> getData() {
        return ResponseEntity.ok();
    }
}
