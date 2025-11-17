class ScoringRulesController < ApplicationController
    before_action :set_scoring_rule, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def index
        @scoring_rules = ScoringRule.all
    end

    def show
    end

    def new
        @scoring_rule = current_user.scoring_rules.build
    end

    def create
        @scoring_rule = current_user.scoring_rules.build scoring_rule_params
        if @scoring_rule.save
            redirect_to new_challenge_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @scoring_rule.update scoring_rule_params
            redirect_to scoring_rule_path(@scoring_rule), notice: "Scoring Rule updated successfully."
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @scoring_rule.destroy
        redirect_to scoring_rules_path
    end

    private
    def set_scoring_rule
        @scoring_rule = ScoringRule.find params[:id]
    end

    def scoring_rule_params
        params.require(:scoring_rule).permit(:rule_type, :description, :factor, :unidad)
    end

    def uri_is_local?(path)
        uri = URI.parse(path) rescue nil
        uri && uri.host.nil?
    end
end
