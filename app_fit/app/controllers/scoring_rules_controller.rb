class ScoringRulesController < ApplicationController
    before_action :set_scoring_rule, only: [:show, :edit, :update, :destroy]

    def index
        @scoring_rules = ScoringRule.all
    end

    def show
    end

    private
    def set_scoring_rule
        @scoring_rule = ScoringRule.find params[:id]
    end
end
