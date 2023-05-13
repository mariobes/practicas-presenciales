package Domain;
import lombok.*;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
@ToString
public class Player {

    private int idPlayer;
    @NonNull
    private String pName;
    @NonNull
    private String lastname;
    @NonNull
    private String position;

    private Teams team;
}
