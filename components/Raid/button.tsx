import {
  Button,
  Card,
  CardActions,
  CardContent,
  CardMedia,
  Typography
} from "@material-ui/core";
import { makeStyles } from "@material-ui/core/styles";
import Link from "next/link";
import { Donjon } from "../../lib/generatedTypes";
import { getDonjonImageUrl } from "../../lib/utils/image";

interface Props {
  donjon: Donjon;
}
const useStyles = makeStyles({
  card: {
    margin: 5
  },
  media: {
    height: 70
  },
  cardContent: {
    padding: 5,
    textAlign: "center"
  },
  cardActions: {
    display: "flex",
    justifyContent: "center",
    padding: 0,
    marginBottom: 10
  }
});
export function CreateRaid({ donjon }: Props) {
  const classes = useStyles("");
  return (
    <Card className={classes.card}>
      <CardMedia
        className={classes.media}
        image={getDonjonImageUrl(donjon.name)}
        title={donjon.name}
      />
      <CardContent className={classes.cardContent}>
        <Typography variant="subtitle1">{donjon.name}</Typography>
      </CardContent>
      <CardActions className={classes.cardActions}>
        <Link href="/raid/create/[id]" as={`/raid/create/${donjon.id}`}>
          <Button size="small" variant="outlined" color="primary">
            <a>Create</a>
          </Button>
        </Link>
      </CardActions>
    </Card>
  );
}
