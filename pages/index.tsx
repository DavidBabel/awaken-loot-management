import {
  Button,
  Card,
  CardActions,
  CardContent,
  CardHeader,
  CardMedia,
  Grid,
  Link
} from "@material-ui/core";
import React, { useContext } from "react";
import MemberContext from "../lib/context/member";

interface Props {
  title: string;
  link: string;
  children: React.ReactNode;
}

function FastCard({ title, children, link }: Props) {
  return (
    <Grid item={true} xs={6}>
      <Card style={{ margin: 10, padding: 10 }}>
        <CardHeader title={title} />
        <CardMedia />
        <CardContent>{children}</CardContent>

        <CardActions style={{ justifyContent: "flex-end" }}>
          <Link href={link}>
            <Button size="small" color="primary" variant="outlined">
              Voir
            </Button>
          </Link>
        </CardActions>
      </Card>
    </Grid>
  );
}

export default function Accueil() {
  const member = useContext(MemberContext);

  return (
    <Grid container={true}>
      <FastCard title="Raids" link="/raid">
        Voir la liste des raids
      </FastCard>
      <FastCard title="Loots" link="/items">
        Voir la liste des Objets et leurs attribs
      </FastCard>
      <FastCard title="Joueurs" link="/player">
        Voir la liste des joueurs
      </FastCard>
      <FastCard title="Présence" link="/attendance">
        Voir la présence en raid des joueurs
      </FastCard>
      <FastCard
        title="Ma spécialisation"
        link={`/player/specialisation/${member.userid}`}
      >
        Replir ma Spécialisation
      </FastCard>
      <FastCard title="Mon mérite" link={`/player/merit/${member.userid}`}>
        Voir mon mérite
      </FastCard>
    </Grid>
  );
}
