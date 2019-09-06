import {
  Card,
  CardActionArea,
  CardMedia,
  CardContent,
  Typography,
  CardActions,
  Button
} from '@material-ui/core';
import { Donjon } from '../../lib/generatedTypes';
import Link from 'next/link';

interface Props {
  donjon: Donjon;
}

export function CreateRaid({ donjon }: Props) {
  return (
    <Card>
      <CardActionArea>
        <CardMedia
          image="/static/images/cards/contemplative-reptile.jpg"
          title={donjon.name}
        />
        <CardContent>
          <Typography gutterBottom variant="h5" component="h2">
            {donjon.name}
          </Typography>
          {/*       <Typography variant="body2" color="textSecondary" component="p">
            Raid of the {date}
          </Typography> */}
        </CardContent>
      </CardActionArea>
      <CardActions>
        {/* <Button size="small" color="primary">
          <Link href="/raid/edit/[id]" as={`/raid/edit/${id}`}>
            <a>Edit</a>
          </Link>
        </Button> */}
        <Button size="small" color="primary">
          <Link href="/raid/create/[id]" as={`/raid/create/${donjon.id}`}>
            <a>Create new</a>
          </Link>
        </Button>
      </CardActions>
    </Card>
  );
}
