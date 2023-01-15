const express = require("express");
const router = express.Router();
const {login, auth} = require("./auth");
const {all, last, single, update, newWS, deleteWS, products} = require("./week_stats");
const {unassigned, WSid, all_supply, last_supply, new_supply} = require("./supply");
const {scaleMeasurement, scaleSingle, setStock, getStock, orderRecommendations} = require("./scale");

router.route("/auth/login").post(login);

router.route("/weekstats/all").all(auth, all);
router.route("/weekstats/last").all(auth, last);
router.route("/weekstats/single").all(auth, single);
router.route("/weekstats/update").all(auth, update);
router.route("/weekstats/new").all(auth, newWS);
router.route("/weekstats/delete").all(auth, deleteWS);
router.route("/weekstats/products").all(auth, products);

router.route("/supply/unassigned").all(auth, unassigned);
router.route("/supply/ws_id").all(auth, WSid);
router.route("/supply/all").all(auth, all_supply);
router.route("/supply/last").all(auth, last_supply);
router.route("/supply/new").all(auth, new_supply);

router.route("/scale/measurement").all(scaleMeasurement);
router.route("/scale/single").all(auth,scaleSingle);
router.route("/scale/setstock").all(auth,setStock);
router.route("/scale/getstock").all(auth,getStock);
router.route("/scale/orders").all(auth,orderRecommendations);

router.route("/auth/test").all(auth,(req, res) => {
    res.status(200).json({
        message: "Authentifiziert!",
        error: false
    });
})
module.exports = router;
