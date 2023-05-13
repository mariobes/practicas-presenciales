package Domain;
import lombok.*;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
@ToString
public class Teams {

    private int idTeam;
    @NonNull
    private String tName;
    @NonNull
    private String stadium;
    @NonNull
    private String city;

}
