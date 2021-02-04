import { useMutation, useQuery } from "@apollo/react-hooks";
import {
  Avatar,
  Button,
  Checkbox,
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
import CircularProgress from "@material-ui/core/CircularProgress";
import IconButton from "@material-ui/core/IconButton";
import { makeStyles } from "@material-ui/core/styles";
import withWidth, { WithWidthProps } from "@material-ui/core/withWidth";
import ChevronLeftIcon from "@material-ui/icons/ChevronLeft";
import ChevronRightIcon from "@material-ui/icons/ChevronRight";
import CloseIcon from "@material-ui/icons/Close";
import Link from "next/link";
import React, { useEffect } from "react";
import ItemsCarousel from "react-items-carousel";
import uuidv4 from "uuid/v4";
import { LoadingAndError } from "../../components/LoadingAndErrors";
import { CreateRaid } from "../../components/Raid/button";
import LinkLine from "../../components/Raid/LinkLine";
import { useMemberContext } from "../../lib/context/member";
import { Mutation, Query, Raid } from "../../lib/generatedTypes";
import {
  UPDATE_RAID_ACTIVE,
  UPDATE_RAID_LINK,
  UpdateRaidActiveVariables,
  UpdateRaidLinkVariables
} from "../../lib/gql/raid-mutations";
import { ALL_DONJONS, ALL_RAIDS_LIGHT } from "../../lib/gql/raid-queries";
import { role } from "../../lib/role-level";
import { getDate } from "../../lib/utils/date";
import { getDonjonIconUrl } from "../../lib/utils/image";
import { byDate } from "../../lib/utils/sorter";

const useStyles = makeStyles(theme => ({
  root: {
    width: "100%",

    height: "calc(100vh - 130px)",
    [theme.breakpoints.down("sm")]: {
      padding: 2
    }
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
    padding: "10px 100px",
    textAlign: "center"
  },
  createRaidPaper: {
    width: "100%",
    maxHeight: "230px",
    flexShrink: 0
  },
  lastRaidsPaper: {
    width: "100%",
    height: "calc(100vh - 360px)",
    [theme.breakpoints.down("sm")]: {
      height: "calc(100vh - 75px)",
      marginTop: 10
    },
    marginTop: 20
  },
  lastRaidsPaperHeader: {
    display: "flex",
    justifyContent: "space-between",
    alignItems: "center",
    paddingRight: "25px"
  },
  tableWrapper: {
    maxHeight: "calc(100vh - 425px)",
    [theme.breakpoints.down("sm")]: {
      maxHeight: "calc(100vh - 135px)"
    },
    overflow: "auto",
    "&::-webkit-scrollbar-thumb": {
      backgroundColor: "#3F51B5",
      borderRadius: "2px"
    },
    "&::-webkit-scrollbar-track": {
      boxShadow: "inset 0 0 6px rgba(0,0,0,0.15)"
    },
    "&::-webkit-scrollbar": {
      width: "10px",
      height: "10px",
      [theme.breakpoints.down("sm")]: {
        width: "5px",
        height: "5px"
      }
    },
    position: "relative"
  },
  table: {
    "& .MuiTableRow-root:nth-child(even)": {
      backgroundColor: "rgba(0,0,0,0.06)"
    },
    "& .MuiTableCell-stickyHeader": {
      backgroundColor: "#dedede"
    }
  },
  textField: {
    margin: "15px 5px",
    maxWidth: "200px",
    height: 40
  },
  lootedNbChip: {
    position: "absolute",
    top: "10px",
    right: "30px",
    zIndex: 4,
    lineHeight: "24px",
    width: 24,
    height: 24,
    textAlign: "center",
    borderRadius: "50%",
    color: "white",
    backgroundColor: "#DC004E"
  },
  carouselProgress: {
    width: "100%",
    height: "180px",
    display: "flex",
    alignItems: "center",
    justifyContent: "center"
  },
  hidden: {
    display: "none"
  }
}));

export default withWidth()(function PageIndex(props: WithWidthProps) {
  const { width: pageWidth } = props;
  const member = useMemberContext();
  const classes = useStyles("");
  const [activeItemIndex, setActiveItemIndex] = React.useState<number>(0);
  const [loadingRender, setLoadingRender] = React.useState<boolean>(true);
  const [raidChecked, setRaidChecked] = React.useState<number[]>([]);
  const [loadingLink, setLoadingLink] = React.useState<boolean>(false);
  useEffect(() => {
    setLoadingRender(false);
  }, []);
  const [updateRaidLink] = useMutation<Mutation, UpdateRaidLinkVariables>(
    UPDATE_RAID_LINK
  );
  const [updateRaidActive] = useMutation<Mutation, UpdateRaidActiveVariables>(
    UPDATE_RAID_ACTIVE
  );
  const {
    loading: loadingDonjons,
    data: dataDonjons,
    error: errorDonjons
  } = useQuery<Query>(ALL_DONJONS);
  const {
    loading: loadingRaids,
    data: dataRaids,
    error: errorRaids,
    refetch: refetchAllRaidsLights
  } = useQuery<Query>(ALL_RAIDS_LIGHT);

  const loading = loadingDonjons || loadingRaids;
  const error = errorDonjons || errorRaids;

  if (loading || error) {
    return <LoadingAndError loading={loading} error={error} />;
  }

  function getNumberOfCarouselItems() {
    if (pageWidth === "xs") {
      return 1;
    }
    if (pageWidth === "md" || pageWidth === "sm") {
      return 2;
    }
    return 3;
  }

  const donjons = dataDonjons.allDonjons.edges;
  const raids = dataRaids.allRaids.nodes;

  raids.sort(byDate("date"));

  const raidLinks = [];
  raids.forEach((raid: Raid) => {
    if (raid.linkBetweenRaids) {
      if (raidLinks.length === 0) {
        raidLinks.push({
          raidLinkId: raid.linkBetweenRaids,
          raidIds: [raid.id],
          raidDates: [raid.date],
          decalage: 0
        });
      } else {
        let raidLinkFound = false;
        raidLinks.forEach(raidLink => {
          if (raidLink.raidLinkId === raid.linkBetweenRaids) {
            raidLink.raidIds.push(raid.id);
            raidLink.raidDates.push(raid.date);
            raidLinkFound = true;
          }
        });
        if (!raidLinkFound) {
          raidLinks.push({
            raidLinkId: raid.linkBetweenRaids,
            raidIds: [raid.id],
            raidDates: [raid.date],
            decalage: 0
          });
        }
      }
    }
  });
  let decalage = 0;
  raidLinks.forEach(raidLink => {
    let linkIntercale = false;
    raidLinks.forEach(rLink => {
      if (rLink.raidLinkId !== raidLink.raidLinkId) {
        rLink.raidDates.forEach(date => {
          if (
            new Date(date) >
              raidLink.raidDates.reduce((a, b) =>
                new Date(a) < new Date(b) ? new Date(a) : new Date(b)
              ) &&
            new Date(date) <
              raidLink.raidDates.reduce((a, b) =>
                new Date(a) > new Date(b) ? new Date(a) : new Date(b)
              )
          ) {
            linkIntercale = true;
          }
        });
      }
    });
    if (linkIntercale) {
      if (decalage > 8) {
        decalage = 0;
      }
      decalage++;
      raidLink.decalage = decalage;
    }
  });

  const handleCheck = (raidId: number) => (
    event: React.ChangeEvent<HTMLInputElement>
  ) => {
    if (event.target.checked) {
      setRaidChecked([...raidChecked, raidId]);
    } else {
      setRaidChecked(raidChecked.filter(raidIdNb => raidIdNb !== raidId));
    }
  };
  const handleLink = () => {
    const linkId = uuidv4();
    setLoadingLink(true);
    Promise.all(
      raidChecked.map(raidIdNb =>
        updateRaidLink({
          variables: {
            raidId: raidIdNb,
            linkId
          }
        })
      )
    )
      .then(resp => {
        setLoadingLink(false);
        setRaidChecked([]);
      })
      .catch(err => {
        alert(err.message);
        setLoadingLink(false);
        setRaidChecked([]);
      });
  };
  const handleUnLink = async (raidId: number, raidLinkId: string) => {
    setLoadingLink(true);
    try {
      await updateRaidLink({
        variables: {
          raidId,
          linkId: ""
        }
      });
      const raidLinked = raids.filter(
        (raid: Raid) =>
          raid.linkBetweenRaids === raidLinkId && raid.id !== raidId
      );
      if (raidLinked && raidLinked.length === 1) {
        const raidBidome = raidLinked[0];
        await updateRaidLink({
          variables: {
            raidId: raidBidome.id,
            linkId: ""
          }
        });
      }
      setLoadingLink(false);
    } catch (err) {
      alert(err.message);
    }
  };

  const zero = <b style={{ color: "red" }}>0</b>;

  return (
    <>
      <Container className={classes.root}>
        <div className={classes.topPapers}>
          {member.level >= role.officer && (
            <Paper className={classes.createRaidPaper}>
              <Typography className={classes.boxTitle} variant="h6">
                Creér un nouveau raid
              </Typography>
              <Divider />
              {loadingRender ? (
                <div className={classes.carouselProgress}>
                  <CircularProgress />
                </div>
              ) : (
                ""
              )}
              <div
                className={
                  loadingRender ? classes.hidden : classes.createRaidCards
                }
              >
                <ItemsCarousel
                  infiniteLoop={true}
                  style={{ maxWidth: 200 }}
                  gutter={20}
                  numberOfCards={getNumberOfCarouselItems()}
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
                    .reverse()
                    .map(({ node: donjon }) => (
                      <CreateRaid
                        key={`create-raid-${donjon.name}`}
                        {...donjon}
                      />
                    ))}
                />
              </div>
            </Paper>
          )}
        </div>
        <Paper className={classes.lastRaidsPaper}>
          <div className={classes.lastRaidsPaperHeader}>
            <Typography className={classes.boxTitleLastRaids} variant="h6">
              Last raids
            </Typography>
            {member.level >= role.officer && (
              <Button
                onClick={handleLink}
                variant="contained"
                disabled={raidChecked.length < 2}
                color="primary"
              >
                {loadingLink ? "LOADING.." : "LIER"}
              </Button>
            )}
          </div>

          <Divider />

          <div className={classes.tableWrapper}>
            <Table className={classes.table} size="small" stickyHeader={true}>
              <TableHead>
                <TableRow>
                  {member.name === "Devilhunter" && (
                    <TableCell style={{ width: "20px", padding: "0 0 0 0" }} />
                  )}
                  <TableCell>Donjon</TableCell>
                  <TableCell>Date</TableCell>
                  <TableCell>Saisie Loot &amp; joueurs</TableCell>
                  <TableCell>Nb loots</TableCell>
                  <TableCell>Nb Joueurs</TableCell>
                  <TableCell>{""}</TableCell>
                  <TableCell>
                    {member.level >= role.officer ? "Lier" : "Liaisons"}
                  </TableCell>
                </TableRow>
              </TableHead>
              <TableBody>
                {raids.map((raid: Raid) => {
                  return (
                    <TableRow key={`raid-${raid.id}`}>
                      {member.name === "Devilhunter" && (
                        <TableCell
                          style={{ width: "20px", padding: "0 0 0 0" }}
                        >
                          <IconButton
                            key="close"
                            aria-label="close"
                            color="inherit"
                            onClick={() =>
                              updateRaidActive({
                                variables: {
                                  raidId: raid.id,
                                  active: false
                                }
                              }).then(() => refetchAllRaidsLights())
                            }
                          >
                            <CloseIcon />
                          </IconButton>
                        </TableCell>
                      )}
                      <TableCell>
                        <div style={{ display: "flex" }}>
                          <Avatar
                            alt={raid.donjonByDonjonId.name}
                            style={{ marginRight: 13, width: 25, height: 25 }}
                            src={
                              raid.donjonByDonjonId?.cdnIconImage ||
                              getDonjonIconUrl(raid.donjonByDonjonId.name)
                            }
                          />
                          {raid.donjonByDonjonId.name}
                        </div>
                      </TableCell>
                      <TableCell>{getDate(raid.date)}</TableCell>
                      <TableCell>{raid.title}</TableCell>
                      <TableCell>
                        {raid.lootsByRaidId?.totalCount || zero}
                      </TableCell>
                      <TableCell>
                        {raid.raidPlayersByRaidId?.totalCount || zero}
                      </TableCell>
                      <TableCell>
                        <Link
                          href="/raid/edit/[id]"
                          as={`/raid/edit/${raid.id}`}
                        >
                          <a target="_blank" style={{ textDecoration: "none" }}>
                            <Button variant="contained" color="primary">
                              VIEW
                            </Button>
                          </a>
                        </Link>
                      </TableCell>

                      <TableCell>
                        {raid.linkBetweenRaids ? (
                          <Button
                            className={`unlink-btn-${raid.id}`}
                            onClick={() => {
                              if (member.level >= role.officer) {
                                handleUnLink(raid.id, raid.linkBetweenRaids);
                              }
                            }}
                            variant="outlined"
                            color="secondary"
                          >
                            {loadingLink
                              ? "Loading..."
                              : member.level >= role.officer
                              ? "DÉLIER"
                              : "LIÉ"}
                          </Button>
                        ) : (
                          member.level >= role.officer && (
                            <Checkbox
                              checked={
                                raidChecked.indexOf(raid.id) !== -1
                                  ? true
                                  : false
                              }
                              onChange={handleCheck(raid.id)}
                              value={`${raid.id}checked`}
                              color="primary"
                              inputProps={{
                                "aria-label": `${raid.id} checkbox`
                              }}
                            />
                          )
                        )}
                      </TableCell>
                    </TableRow>
                  );
                })}
              </TableBody>
            </Table>
            {!loadingLink &&
              raidLinks.map(raidLink => (
                <LinkLine
                  key={"linkline-" + raidLink.raidLinkId}
                  raidIds={raidLink.raidIds}
                  decalage={raidLink.decalage}
                />
              ))}
          </div>
        </Paper>
      </Container>
    </>
  );
});

// TODO
// helper getAll (object , key) sur le graphql

// TODO try to use getInitialProps
