-- Automatically generated, do not edit.
\unset ON_ERROR_STOP

DROP TABLE annotation;
DROP TABLE application;
DROP TABLE area;
DROP TABLE area_alias;
DROP TABLE area_alias_type;
DROP TABLE area_annotation;
DROP TABLE area_gid_redirect;
DROP TABLE area_tag;
DROP TABLE area_tag_raw;
DROP TABLE area_type;
DROP TABLE artist;
DROP TABLE artist_alias;
DROP TABLE artist_alias_type;
DROP TABLE artist_annotation;
DROP TABLE artist_credit;
DROP TABLE artist_credit_name;
DROP TABLE artist_deletion;
DROP TABLE artist_gid_redirect;
DROP TABLE artist_ipi;
DROP TABLE artist_isni;
DROP TABLE artist_meta;
DROP TABLE artist_rating_raw;
DROP TABLE artist_tag;
DROP TABLE artist_tag_raw;
DROP TABLE artist_type;
DROP TABLE autoeditor_election;
DROP TABLE autoeditor_election_vote;
DROP TABLE cdtoc;
DROP TABLE cdtoc_raw;
DROP TABLE country_area;
DROP TABLE edit;
DROP TABLE edit_area;
DROP TABLE edit_artist;
DROP TABLE edit_event;
DROP TABLE edit_instrument;
DROP TABLE edit_label;
DROP TABLE edit_note;
DROP TABLE edit_place;
DROP TABLE edit_recording;
DROP TABLE edit_release;
DROP TABLE edit_release_group;
DROP TABLE edit_series;
DROP TABLE edit_url;
DROP TABLE edit_work;
DROP TABLE editor;
DROP TABLE editor_collection;
DROP TABLE editor_collection_release;
DROP TABLE editor_language;
DROP TABLE editor_oauth_token;
DROP TABLE editor_preference;
DROP TABLE editor_subscribe_artist;
DROP TABLE editor_subscribe_artist_deleted;
DROP TABLE editor_subscribe_collection;
DROP TABLE editor_subscribe_editor;
DROP TABLE editor_subscribe_label;
DROP TABLE editor_subscribe_label_deleted;
DROP TABLE editor_subscribe_series;
DROP TABLE editor_subscribe_series_deleted;
DROP TABLE editor_watch_artist;
DROP TABLE editor_watch_preferences;
DROP TABLE editor_watch_release_group_type;
DROP TABLE editor_watch_release_status;
DROP TABLE event;
DROP TABLE event_alias;
DROP TABLE event_alias_type;
DROP TABLE event_annotation;
DROP TABLE event_gid_redirect;
DROP TABLE event_meta;
DROP TABLE event_rating_raw;
DROP TABLE event_tag;
DROP TABLE event_tag_raw;
DROP TABLE event_type;
DROP TABLE gender;
DROP TABLE instrument;
DROP TABLE instrument_alias;
DROP TABLE instrument_alias_type;
DROP TABLE instrument_annotation;
DROP TABLE instrument_gid_redirect;
DROP TABLE instrument_tag;
DROP TABLE instrument_tag_raw;
DROP TABLE instrument_type;
DROP TABLE iso_3166_1;
DROP TABLE iso_3166_2;
DROP TABLE iso_3166_3;
DROP TABLE isrc;
DROP TABLE iswc;
DROP TABLE l_area_area;
DROP TABLE l_area_artist;
DROP TABLE l_area_event;
DROP TABLE l_area_instrument;
DROP TABLE l_area_label;
DROP TABLE l_area_place;
DROP TABLE l_area_recording;
DROP TABLE l_area_release;
DROP TABLE l_area_release_group;
DROP TABLE l_area_series;
DROP TABLE l_area_url;
DROP TABLE l_area_work;
DROP TABLE l_artist_artist;
DROP TABLE l_artist_event;
DROP TABLE l_artist_instrument;
DROP TABLE l_artist_label;
DROP TABLE l_artist_place;
DROP TABLE l_artist_recording;
DROP TABLE l_artist_release;
DROP TABLE l_artist_release_group;
DROP TABLE l_artist_series;
DROP TABLE l_artist_url;
DROP TABLE l_artist_work;
DROP TABLE l_event_event;
DROP TABLE l_event_instrument;
DROP TABLE l_event_label;
DROP TABLE l_event_place;
DROP TABLE l_event_recording;
DROP TABLE l_event_release;
DROP TABLE l_event_release_group;
DROP TABLE l_event_series;
DROP TABLE l_event_url;
DROP TABLE l_event_work;
DROP TABLE l_instrument_instrument;
DROP TABLE l_instrument_label;
DROP TABLE l_instrument_place;
DROP TABLE l_instrument_recording;
DROP TABLE l_instrument_release;
DROP TABLE l_instrument_release_group;
DROP TABLE l_instrument_series;
DROP TABLE l_instrument_url;
DROP TABLE l_instrument_work;
DROP TABLE l_label_label;
DROP TABLE l_label_place;
DROP TABLE l_label_recording;
DROP TABLE l_label_release;
DROP TABLE l_label_release_group;
DROP TABLE l_label_series;
DROP TABLE l_label_url;
DROP TABLE l_label_work;
DROP TABLE l_place_place;
DROP TABLE l_place_recording;
DROP TABLE l_place_release;
DROP TABLE l_place_release_group;
DROP TABLE l_place_series;
DROP TABLE l_place_url;
DROP TABLE l_place_work;
DROP TABLE l_recording_recording;
DROP TABLE l_recording_release;
DROP TABLE l_recording_release_group;
DROP TABLE l_recording_series;
DROP TABLE l_recording_url;
DROP TABLE l_recording_work;
DROP TABLE l_release_group_release_group;
DROP TABLE l_release_group_series;
DROP TABLE l_release_group_url;
DROP TABLE l_release_group_work;
DROP TABLE l_release_release;
DROP TABLE l_release_release_group;
DROP TABLE l_release_series;
DROP TABLE l_release_url;
DROP TABLE l_release_work;
DROP TABLE l_series_series;
DROP TABLE l_series_url;
DROP TABLE l_series_work;
DROP TABLE l_url_url;
DROP TABLE l_url_work;
DROP TABLE l_work_work;
DROP TABLE label;
DROP TABLE label_alias;
DROP TABLE label_alias_type;
DROP TABLE label_annotation;
DROP TABLE label_deletion;
DROP TABLE label_gid_redirect;
DROP TABLE label_ipi;
DROP TABLE label_isni;
DROP TABLE label_meta;
DROP TABLE label_rating_raw;
DROP TABLE label_tag;
DROP TABLE label_tag_raw;
DROP TABLE label_type;
DROP TABLE language;
DROP TABLE link;
DROP TABLE link_attribute;
DROP TABLE link_attribute_credit;
DROP TABLE link_attribute_text_value;
DROP TABLE link_attribute_type;
DROP TABLE link_creditable_attribute_type;
DROP TABLE link_text_attribute_type;
DROP TABLE link_type;
DROP TABLE link_type_attribute_type;
DROP TABLE medium;
DROP TABLE medium_cdtoc;
DROP TABLE medium_format;
DROP TABLE medium_index;
DROP TABLE orderable_link_type;
DROP TABLE place;
DROP TABLE place_alias;
DROP TABLE place_alias_type;
DROP TABLE place_annotation;
DROP TABLE place_gid_redirect;
DROP TABLE place_tag;
DROP TABLE place_tag_raw;
DROP TABLE place_type;
DROP TABLE recording;
DROP TABLE recording_annotation;
DROP TABLE recording_gid_redirect;
DROP TABLE recording_meta;
DROP TABLE recording_rating_raw;
DROP TABLE recording_tag;
DROP TABLE recording_tag_raw;
DROP TABLE release;
DROP TABLE release_annotation;
DROP TABLE release_country;
DROP TABLE release_coverart;
DROP TABLE release_gid_redirect;
DROP TABLE release_group;
DROP TABLE release_group_annotation;
DROP TABLE release_group_gid_redirect;
DROP TABLE release_group_meta;
DROP TABLE release_group_primary_type;
DROP TABLE release_group_rating_raw;
DROP TABLE release_group_secondary_type;
DROP TABLE release_group_secondary_type_join;
DROP TABLE release_group_tag;
DROP TABLE release_group_tag_raw;
DROP TABLE release_label;
DROP TABLE release_meta;
DROP TABLE release_packaging;
DROP TABLE release_raw;
DROP TABLE release_status;
DROP TABLE release_tag;
DROP TABLE release_tag_raw;
DROP TABLE release_unknown_country;
DROP TABLE replication_control;
DROP TABLE script;
DROP TABLE series;
DROP TABLE series_alias;
DROP TABLE series_alias_type;
DROP TABLE series_annotation;
DROP TABLE series_deletion;
DROP TABLE series_gid_redirect;
DROP TABLE series_ordering_type;
DROP TABLE series_tag;
DROP TABLE series_tag_raw;
DROP TABLE series_type;
DROP TABLE tag;
DROP TABLE tag_relation;
DROP TABLE track;
DROP TABLE track_gid_redirect;
DROP TABLE track_raw;
DROP TABLE url;
DROP TABLE url_gid_redirect;
DROP TABLE vote;
DROP TABLE work;
DROP TABLE work_alias;
DROP TABLE work_alias_type;
DROP TABLE work_annotation;
DROP TABLE work_attribute;
DROP TABLE work_attribute_type;
DROP TABLE work_attribute_type_allowed_value;
DROP TABLE work_gid_redirect;
DROP TABLE work_meta;
DROP TABLE work_rating_raw;
DROP TABLE work_tag;
DROP TABLE work_tag_raw;
DROP TABLE work_type;
