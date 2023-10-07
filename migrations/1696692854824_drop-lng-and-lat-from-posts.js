/* eslint-disable camelcase */

exports.shorthands = undefined;

exports.up = (pgm) => {
  pgm.sql(`
        alter table posts 
        drop column lat,
        drop column lng;
    `);
};

exports.down = (pgm) => {
  pgm.sql(`
        alter table posts 
        add column lat,
        add column lng;
    `);
};
