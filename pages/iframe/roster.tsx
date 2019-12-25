import { useQuery } from "@apollo/react-hooks";
import { LoadingAndError } from "../../components/LoadingAndErrors";
import { Player, Query } from "../../lib/generatedTypes";
import { ALL_CLASSES, ALL_PLAYERS } from "../../lib/gql/player-queries";
import { byValue } from "../../lib/utils/sorter";

// the iframe which is displayed in awaken.se
interface ClassInfo {
  shivtrIcon: string;
  prepend: string;
  maxPlayer: number;
}

export default function PageRoster() {
  const {
    loading: loadingPlayers,
    data: dataPlayers,
    error: errorPlayers
  } = useQuery<Query>(ALL_PLAYERS);
  const {
    loading: loadingClasses,
    data: dataClasses,
    error: errorClasses
  } = useQuery<Query>(ALL_CLASSES);

  const loading = loadingClasses || loadingPlayers;
  const error = errorClasses || errorPlayers;
  if (loading || error) {
    return <LoadingAndError loading={loading} error={error} />;
  }

  const players = dataPlayers.allPlayers.nodes.filter(p => p.inRoster);
  const classes = dataClasses.allClasses.nodes;

  const classesInfos: { [x: string]: ClassInfo } = {
    Prêtre: {
      shivtrIcon: "16",
      prepend: "H",
      maxPlayer: -1
    },
    Druide: {
      shivtrIcon: "22",
      prepend: "R",
      maxPlayer: -1
    },
    Chaman: {
      shivtrIcon: "18",
      prepend: "R",
      maxPlayer: -1
    },
    Mage: {
      shivtrIcon: "19",
      prepend: "",
      maxPlayer: -1
    },
    Démoniste: {
      shivtrIcon: "20",
      prepend: "",
      maxPlayer: -1
    },
    Voleur: {
      shivtrIcon: "15",
      prepend: "",
      maxPlayer: -1
    },
    Chasseur: {
      shivtrIcon: "14",
      prepend: "",
      maxPlayer: -1
    },
    ["Guerrier Tank"]: {
      shivtrIcon: "12",
      prepend: "",
      maxPlayer: -1
    },
    ["Guerrier DPS"]: {
      shivtrIcon: "17",
      prepend: "",
      maxPlayer: -1
    }
  };

  // COLORS :
  const close = "#ba2020";
  const low = "#acacac";
  const open = "#35cc00";
  const priority = "#94ff6f";

  const classesToDisplay = classes
    .map(classe => {
      const classInfos = classesInfos[classe.name];
      if (classInfos) {
        const playerCount = players.filter(
          (p: Player) => p.classId === classe.id
        ).length;
        const criticalColor = [close, low, open, priority];

        const diff = Math.max(0, classInfos.maxPlayer - playerCount);
        return {
          ...classe,
          ...classInfos,
          playerCount,
          criticalColor: criticalColor[diff]
        };
      }
      return null;
    })
    .filter(x => x)
    .sort(byValue("playerCount", false));

  return (
    <div style={{ backgroundColor: "#1C1C1C", padding: 5 }}>
      <div>
        <div>
          <div>
            <a
              href="http://www.awaken.se/forums/2217963"
              style={{ color: "#ba2020" }}
            >
              Roster en construction
            </a>
          </div>
          <br />

          {classesToDisplay.map(c => (
            <div key={c.name} style={{ margin: 2 }}>
              <div style={{ color: "#aaaaaa" }}>
                <img
                  style={{ marginBottom: -5, marginRight: 6 }}
                  alt="Out"
                  src={`http://cloudfront.shivtr.com/game_classes/${c.shivtrIcon}/out.png`}
                />
                <b>{c.prepend}</b>
                {c.name}
                <small
                  className="recruit-status other_text"
                  style={{
                    color: c.criticalColor,
                    float: "right",
                    marginTop: 3
                  }}
                >
                  {c.playerCount}/{c.maxPlayer === -1 ? "?" : c.maxPlayer}
                </small>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}

// <div className="recruit" style="line-height: 16px; margin-bottom: 2px;">

// style="vertical-align: middle; margin-right: 5px; max-width: 100%; height: auto; vertical-align: middle; border: 0;"

// style="float: right; color: #94ff6f; font-weight: bold;"

// Text recrutmenent backup : Si vous souhaitez rejoindre notre communauté, merci de bien lire la charte et de postuler ici.
// + reenable wrinting for guests

// -->
