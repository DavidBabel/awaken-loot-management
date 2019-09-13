import { ClassItem } from "../lib/generatedTypes";
import Avatar from "@material-ui/core/Avatar";
import Chip from "@material-ui/core/Chip";
import Badge from "@material-ui/core/Badge";
import { createStyles, Theme, makeStyles } from "@material-ui/core/styles";

interface Props extends ClassItem {
  countLootByClass: { [className: string]: number };
}

export function ClassItemCard({
  countLootByClass,
  itemValueForThisClass,
  classByClassId: { color, name }
}: Props) {
  const useStyles = makeStyles((theme: Theme) =>
    createStyles({
      root: {
        display: "flex",
        justifyContent: "center",
        flexWrap: "wrap"
      },
      chip: {
        margin: theme.spacing(1),
        color: color,
        borderColor: color,
        backgroundColor: "white"
      },
      avatar: {
        backgroundColor: color
      },
      badge: {
        margin: theme.spacing(1),
        padding: theme.spacing(0, 0)
      }
    })
  );
  const styleClasses = useStyles("");
  return (
    <div>
      <div />
      <div>
        <Badge
          className={styleClasses.badge}
          badgeContent={countLootByClass[name]}
          color="primary">
          <Chip
            avatar={
              <Avatar className={styleClasses.avatar}>
                {itemValueForThisClass}
              </Avatar>
            }
            label={name}
            className={styleClasses.chip}
            variant="outlined"
          />
        </Badge>
        {/* (loot {countLootByClass[name] || 0} times) */}
      </div>
    </div>
  );
}
