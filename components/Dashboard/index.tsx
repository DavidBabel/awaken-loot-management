import {
  AppBar,
  Container,
  CssBaseline,
  Divider,
  Drawer,
  Grid,
  IconButton,
  makeStyles,
  Toolbar,
  Typography
} from "@material-ui/core";
import ChevronLeftIcon from "@material-ui/icons/ChevronLeft";
import MenuIcon from "@material-ui/icons/Menu";
import clsx from "clsx";
import React, { useEffect } from "react";
import { useOnMobile } from "../../lib/hooks/mobilecheck";
import { Menu } from "../Menu/Menu";

const drawerWidth = 240;

const useStyles = makeStyles(theme => ({
  root: {
    display: "flex"
  },
  toolbar: {
    paddingRight: 24 // keep right padding when drawer closed
  },
  toolbarIcon: {
    display: "flex",
    alignItems: "center",
    justifyContent: "flex-end",
    padding: "0 8px",
    ...theme.mixins.toolbar
  },
  appBar: {
    zIndex: theme.zIndex.drawer + 1,
    transition: theme.transitions.create(["width", "margin"], {
      easing: theme.transitions.easing.sharp,
      duration: theme.transitions.duration.leavingScreen
    })
  },
  appBarShift: {
    marginLeft: drawerWidth,
    width: `calc(100% - ${drawerWidth}px)`,
    transition: theme.transitions.create(["width", "margin"], {
      easing: theme.transitions.easing.sharp,
      duration: theme.transitions.duration.enteringScreen
    })
  },
  menuButton: {
    marginRight: 36
  },
  menuButtonHidden: {
    display: "none"
  },
  title: {
    flexGrow: 1,
    display: "flex",
    alignItems: "center",
    justifyContent: "space-between"
  },
  logo: {
    width: 44,
    height: 44,
    display: "flex",
    alignItems: "center",
    [theme.breakpoints.down("sm")]: {
      display: "none"
    }
  },
  drawerPaper: {
    position: "relative",
    whiteSpace: "nowrap",
    width: drawerWidth,
    transition: theme.transitions.create("width", {
      easing: theme.transitions.easing.sharp,
      duration: theme.transitions.duration.enteringScreen
    })
  },
  drawerPaperClose: {
    overflowX: "hidden",
    transition: theme.transitions.create("width", {
      easing: theme.transitions.easing.sharp,
      duration: theme.transitions.duration.leavingScreen
    }),
    width: 0
  },
  appBarSpacer: theme.mixins.toolbar,
  content: {
    flexGrow: 1,
    height: "100vh",
    overflow: "auto"
  },
  container: {
    paddingTop: theme.spacing(4),
    paddingBottom: theme.spacing(4),
    width: "100%",
    [theme.breakpoints.down("sm")]: {
      padding: 0
    }
  },
  grid: {
    width: "100%",
    margin: 0
  },
  paper: {
    padding: theme.spacing(2),
    display: "flex",
    overflow: "auto",
    flexDirection: "column"
  },
  fixedHeight: {
    height: 240
  },
  copyright: {
    position: "absolute",
    width: drawerWidth,
    fontSize: "12px",
    bottom: 10,
    left: 0,
    zIndex: 1000000,
    transition: "left 0.2s ease-in-out"
  },

  hidden: {
    left: -drawerWidth,
    transition: "left 0.2s ease-in-out"
  }
}));

interface Props {
  children: React.ReactNode;
  isMobile: boolean;
}

export function Dashboard({ children, isMobile }: Props) {
  const classes = useStyles({});
  const onMobile = useOnMobile(isMobile);
  const [open, setOpen] = React.useState(!onMobile);
  const handleDrawerOpen = () => {
    setOpen(true);
  };
  const handleDrawerClose = clickFromMobile => {
    if (clickFromMobile === undefined || clickFromMobile) {
      setOpen(false);
    }
  };
  // const fixedHeightPaper = clsx(classes.paper, classes.fixedHeight);
  useEffect(() => {
    if (!onMobile) {
      setOpen(true);
    }
  }, [onMobile]);
  if (
    global.hasOwnProperty("window") &&
    window &&
    window.location &&
    window.location.href.includes("/iframe/")
  ) {
    return <>{children}</>;
  }

  return (
    <div className={classes.root}>
      <CssBaseline />
      <AppBar
        position="absolute"
        className={clsx(classes.appBar, open && classes.appBarShift)}
      >
        <Toolbar className={classes.toolbar}>
          <IconButton
            edge="start"
            color="inherit"
            aria-label="open drawer"
            onClick={handleDrawerOpen}
            className={clsx(
              classes.menuButton,
              open && classes.menuButtonHidden
            )}
          >
            <MenuIcon />
          </IconButton>
          <Typography
            component="h1"
            variant="h6"
            color="inherit"
            noWrap={true}
            className={classes.title}
          >
            <span>Awaken Raid Management</span>
            <div className={classes.logo}>
              <img alt="awaken logo" src="/icon/white_icon.svg" width="100%" />
            </div>
          </Typography>
          {/* <IconButton color="inherit">
            <Badge badgeContent={4} color="secondary">
              <NotificationsIcon />
            </Badge>
          </IconButton> */}
        </Toolbar>
      </AppBar>
      <Drawer
        classes={{
          paper: clsx(classes.drawerPaper, !open && classes.drawerPaperClose)
        }}
        open={open}
        variant={onMobile ? "temporary" : "permanent"}
        onClose={handleDrawerClose}
      >
        <div className={classes.toolbarIcon}>
          <IconButton onClick={handleDrawerClose}>
            <ChevronLeftIcon />
          </IconButton>
        </div>
        <Divider />
        <Menu handleDrawerClose={handleDrawerClose} />
        {/* <List>{mainListItems}</List> */}
        {/* <Divider /> */}
        {/* <List>{secondaryListItems}</List> */}
      </Drawer>
      <main className={classes.content}>
        <div className={classes.appBarSpacer} />
        <Container maxWidth="lg" className={classes.container}>
          <Grid container={true} spacing={3} className={classes.grid}>
            {children}
          </Grid>
        </Container>
        {/* <Hidden smDown>
          <Typography
            className={classes.copyright + " " + (!open && classes.hidden)}
            variant="body2"
            color="textSecondary"
            align="center"
          >
            {"Copyright © "}
            <Link color="inherit" href="http://awaken.se/">
              Awaken raid manager
            </Link>{" "}
            {new Date().getFullYear()}
            {". Developpé par Thorsen et Devilhunter."}
          </Typography>
        </Hidden> */}
      </main>
    </div>
  );
}
