import { useQuery } from "@apollo/react-hooks";
import {
  Button,
  Container,
  Divider,
  Paper,
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableRow,
  Typography
} from "@material-ui/core";
import IconButton from "@material-ui/core/IconButton";
import { makeStyles } from "@material-ui/core/styles";
import ChevronLeftIcon from "@material-ui/icons/ChevronLeft";
import ChevronRightIcon from "@material-ui/icons/ChevronRight";
import Link from "next/link";
import React, { useContext } from "react";
import ItemsCarousel from "react-items-carousel";
import { LoadingAndError } from "../../components/LoadingAndErrors";
import { CreateRaid } from "../../components/Raid/button";
import MemberContext from "../../lib/context/member";
import { Query } from "../../lib/generatedTypes";
import { ALL_DONJONS, ALL_RAIDS } from "../../lib/gql/raid-queries";
import { role } from "../../lib/role-level";
import { byDate } from "../../lib/utils/sorter";

// import { getAll } from '../lib/helpers/graphql-helpers';
const useStyles = makeStyles({
  root: {
    width: "100%",
    height: "calc(100vh - 130px)"
  },
  topPapers: {
    display: "flex",
    justifyContent: "space-between"
  },
  boxTitle: { margin: "10px 20px" },
  boxTitleLastRaids: { margin: "10px 20px", paddingTop: 10 },
  boxLastRaids: {
    width: "100%"
  },
  createRaidCards: {
    padding: "10px 100px"
  },
  createRaidPaper: {
    width: "50%",
    marginRight: 20
  },
  searchPlayerPaper: {
    width: "50%"
  },
  lastRaidsPaper: {
    width: "100%",
    height: "calc(100vh - 370px)",
    marginTop: 20
  },
  tableWrapper: {
    maxHeight: "calc(100vh - 425px)",
    overflow: "auto"
  },
  table: {}
});

export default function PageIndex() {
  const member = useContext(MemberContext);
  const classes = useStyles("");
  const [activeItemIndex, setActiveItemIndex] = React.useState(0);
  const {
    loading: loadingDonjons,
    data: dataDonjons,
    error: errorDonjons
  } = useQuery<Query>(ALL_DONJONS);
  const {
    loading: loadingRaids,
    data: dataRaids,
    error: errorRaids
  } = useQuery<Query>(ALL_RAIDS);
  // const router = useRouter();

  const loading = loadingDonjons || loadingRaids;
  const error = errorDonjons || errorRaids;

  if (loading || error) {
    return <LoadingAndError loading={loading} error={error} />;
  }

  const donjons = dataDonjons.allDonjons.edges;
  const raids = dataRaids.allRaids.nodes;

  raids.sort(byDate("date"));
  // const raidDiffTime = 0;
  // raids[0] &&
  // moment(raids[0].date, 'YYYY-MM-DD').diff(moment()) / (1000 * 60 * 60);
  // const alreadyRaidToday = raidDiffTime > -25 && raidDiffTime < 0;

  return (
    <Container className={classes.root}>
      <div className={classes.topPapers}>
        {member.level >= role.officer && (
          <Paper className={classes.createRaidPaper}>
            <Typography className={classes.boxTitle} variant="h6">
              Create new raid
            </Typography>
            <Divider />
            <div className={classes.createRaidCards}>
              <ItemsCarousel
                infiniteLoop={true}
                gutter={20}
                numberOfCards={1}
                activeItemIndex={activeItemIndex}
                requestToChangeActive={setActiveItemIndex}
                activePosition={"center"}
                showSlither={false}
                firstAndLastGutter={false}
                rightChevron={
                  <IconButton>
                    <ChevronRightIcon color="primary" />
                  </IconButton>
                }
                leftChevron={
                  <IconButton>
                    <ChevronLeftIcon color="primary" />
                  </IconButton>
                }
                outsideChevron={true}
                chevronWidth={100}
                children={donjons
                  .filter(({ node: donjon }) => donjon.active)
                  .map(({ node: donjon }) => (
                    <CreateRaid key={donjon.name} donjon={donjon} />
                  ))}
              />
            </div>
          </Paper>
        )}
        <Paper
          className={classes.searchPlayerPaper}
          style={{
            width: member.level < role.officer ? "100%" : "50%",
            height: member.level < role.officer ? "230px" : "auto"
          }}
        >
          <Typography className={classes.boxTitle} variant="h6">
            Search player
          </Typography>
          <Divider />
        </Paper>
      </div>
      <Paper className={classes.lastRaidsPaper}>
        <Typography className={classes.boxTitleLastRaids} variant="h6">
          Last raids
        </Typography>
        <Divider />
        <div className={classes.tableWrapper}>
          <Table className={classes.table} size="small" stickyHeader={true}>
            <TableHead>
              <TableRow>
                <TableCell>Donjon</TableCell>
                <TableCell>Date</TableCell>
                <TableCell>{""}</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {raids.map(raid => {
                return (
                  <TableRow key={`raid-${raid.id}`}>
                    <TableCell>{raid.donjonByDonjonId.name}</TableCell>
                    <TableCell>{raid.date}</TableCell>
                    <TableCell>
                      <Link href="/raid/edit/[id]" as={`/raid/edit/${raid.id}`}>
                        <Button variant="contained" color="primary">
                          <a>VIEW</a>
                        </Button>
                      </Link>
                    </TableCell>
                  </TableRow>
                );
              })}
            </TableBody>
          </Table>
        </div>
      </Paper>
    </Container>
  );
}
// TODO
// helper getAll (object , key) sur le graphql

// TODO try to use getInitialProps
