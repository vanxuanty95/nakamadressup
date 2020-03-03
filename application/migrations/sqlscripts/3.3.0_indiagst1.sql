UPDATE `ospos_consignmenters`
  SET `tax_id` = ''
  WHERE `tax_id`IS NULL;

ALTER TABLE `ospos_consignmenters`
	CHANGE COLUMN `tax_id` `tax_id` varchar(32) NOT NULL DEFAULT '';
