'use strict';

/**
 * sqlize for aws
 * // Instantiate new Sequelize instance!
export const sequelize = new Sequelize({
  "username": "AWS RDS USER",
  "password": "AWS RDS PASS",
  "database": "postgres",
  "host":     "******.******.us-east-1.rds.amazonaws.com",

  dialect: 'postgres',
  storage: ':memory:',
});
 */
const { Sequelize, DataTypes } = require('sequelize');
var url = require("url");
const express = require('express');
var connectionString =  'postgres://user:example@192.168.0.17:5432/db' //process.env.DATABASE_URL
console.log('database url from env is: ', connectionString)
// set timezone
process.env.TZ = 'Europe/London';
const sequelize = new Sequelize(connectionString);

async function main() {
    
    try {
        await sequelize.authenticate();
        console.log("Connection has authed successfully");
    } catch (error) {
        console.error("Unable to connect to the database", error);
    }
    

    
}
// Constants
const PORT = 4000;
const HOST = '0.0.0.0';

const app = express()

main().then(console.log("Success!")).catch(console.error);

// define Pass model
const pass = sequelize.define('passes', {
    passid: {
        primaryKey: true,
        type: DataTypes.INTEGER,
        allowNull: false 
    },
    passtype: {
        type: DataTypes.STRING,
        allowNull: false
    },
    passcategory: {
        type: DataTypes.STRING,
        allowNull: false
    },
    passstatus: {
        type: DataTypes.STRING,
        allowNull: false
    },
    passnumber: {
        type: DataTypes.STRING,
        allowNull: true
    },
    dateissued: {
        type: DataTypes.DATE,
        allowNull: false
    },
    dateexpiry: {
        type: DataTypes.DATE,
        allowNull: false
    },
    visitorid: {
        type: DataTypes.INTEGER,
        allowNull: false 
    },
    createddatetime: {
        type: DataTypes.DATE,
        allowNull: false
    },
    lastupdateddatetime: {
        type: DataTypes.DATE,
        allowNull: false
    },
}, {
    timestamps: false, 
    freezeTableName: true //to hook the query up to correct table name "passes"
})

// define Site model
const site = sequelize.define('site', {
    id: {
        primaryKey: true,
        type: DataTypes.INTEGER,
        allowNull: false
    },
    siteid: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    sapid: {
        type: DataTypes.STRING,
        allowNull: false
    },
    sapretailno: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    sitename: {
        type: DataTypes.STRING,
        allowNull: false
    },
    town: {
        type: DataTypes.STRING,
        allowNull: false
    },
    channeloftrade: {
        type: DataTypes.STRING,
        allowNull: true
    },
    installationcount: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    createddatetime: {
        type: DataTypes.DATE,
        allowNull: false
    },
    lastupdateddatetime: {
        type: DataTypes.DATE,
        allowNull: false
    },
    countryid: {
        type: DataTypes.INTEGER,
        allowNull: false
    }
}, {
    timestamps: false
})

const visit = sequelize.define('visit', {
    visitid: {
        primaryKey: true,
        type: DataTypes.INTEGER,
        allowNull: false
    },
    siteid: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    visitpurpose: {
        type: DataTypes.STRING,
        allowNull: true
    },
    expecteddurationhrs: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    signindatetime: {
        type: DataTypes.DATE,
        allowNull: false
    },
    signinstaffid: {
        type: DataTypes.STRING,
        allowNull: true
    },
    signoutdatetime: {
        type: DataTypes.DATE,
        allowNull: false
    },
    signoutstaffid: {
        type: DataTypes.STRING,
        allowNull: true
    },
    welfarecheck: {
        type: DataTypes.STRING,
        allowNull: true
    },
    vehicleid: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    createddatetime: {
        type: DataTypes.DATE,
        allowNull: false
    },
    lastupdateddatetime: {
        type: DataTypes.DATE,
        allowNull: false
    },
    visitorpresentatsignout: {
        type: DataTypes.STRING,
        allowNull: true
    },
}, {
    timestamps: false
});

visit.belongsTo(pass, { foreignKey: 'passid' });

app.get('/visits', async (req, res) => {
    if (req.query.page == null || req.query.limit == null) {
        console.log("returning default set");
        const visits = await visit.findAll();
        var result = {};
        result.visits = visits;
        res.json(result);
    } else {
        const page = parseInt(req.query.page)
        const limit = parseInt(req.query.limit)
    
        console.log(page);
    
        const startIndex = (page - 1) * limit
        const endIndex = limit
    
        console.log("startIndex: " + startIndex);
        console.log("endIndex: " + endIndex);
    
        const visits = await visit.findAndCountAll({
            include: pass,
            limit: endIndex, 
            offset: startIndex
        });
        var result = {};
        result.count = visits.count;
        result.page = page;
        result.visits = visits.rows;
        res.json(result);
    }
})

app.get('/passes', async (req, res) => {
    if (req.query.page == null || req.query.limit == null) {
        console.log("returning default set");
        const passes = await pass.findAll();
        var result = {};
        result.passes = passes;
        res.json(result);
    } else {
        const page = parseInt(req.query.page)
        const limit = parseInt(req.query.limit)
    
        if (!(typeof page === "number")) {
            page = 1;
        } 
        if (!(typeof limit === "number")) {
            limit = 10;
        } 
    
        const startIndex = (page - 1) * limit
        const endIndex = limit
    
        console.log("startIndex: " + startIndex);
        console.log("endIndex: " + endIndex);
    
        const passes = await pass.findAndCountAll({
            limit: endIndex, 
            offset: startIndex
        });
        var result = {};
        result.count = passes.count;
        result.page = page;
        result.passes = passes.rows;
        res.json(result);
    }
})

app.get('/sites', async (req,res) =>  {
    if (req.query.page == null || req.query.limit == null) {
        console.log("returning default set");
        const sites = await site.findAll();
        var result = {};
        result.sites = sites;
        res.json(result);
    } else {
        const page = parseInt(req.query.page)
        const limit = parseInt(req.query.limit)
    
        if (!(typeof page === "number")) {
            page = 1;
        } 
        if (!(typeof limit === "number")) {
            limit = 10;
        } 
    
        const startIndex = (page - 1) * limit
        const endIndex = limit
    
        console.log("startIndex: " + startIndex);
        console.log("endIndex: " + endIndex);
    
        const sites = await site.findAndCountAll(
            {
                limit: endIndex, 
                offset: startIndex
            });
    
        var result = {};
        result.count = sites.count;
        result.page = page;
        result.sites = sites.rows;
        res.json(result);
    }
})

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);